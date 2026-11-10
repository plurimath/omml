# frozen_string_literal: true

require "json"
require "digest"

module Omml
  # Only explicitly verified scalar declarations participate in this registry.
  module Portable
    REGISTRY_VERSION = 1
    DIRECTORY = File.expand_path("../../model/portable", __dir__).freeze
    ENUM_TYPES = %i[STBrType STBrClear].freeze
    REQUIRED_RUNTIME = "portable scalar export requires " \
                       "named-value declaration registry version 1"

    class UnsupportedRuntime < StandardError; end

    module_function

    def model_declarations
      entry = declaration_manifest.fetch("graphs").fetch("enum-subset-v1")
      bytes = File.binread(File.join(DIRECTORY, entry.fetch("file")))
      unless Digest::SHA256.hexdigest(bytes) == entry.fetch("sha256")
        raise UnsupportedRuntime, "OMML model declaration checksum mismatch"
      end

      JSON.parse(bytes)
    end

    def enum_declarations
      require_registry!
      entries = ENUM_TYPES.to_h do |name|
        klass = Omml::Models.const_get(name, false)
        [klass, enum_definition(klass)]
      end
      Lutaml::Model::Lml::ValueDeclarations.new(entries,
                                                version: REGISTRY_VERSION)
    end

    def export_bundle(roots, register: nil)
      declarations = enum_declarations
      Omml::Models.eager_load!
      Omml::Configuration.populate_context! unless Omml::Configuration.context
      Lutaml::Model::Lml.export_bundle(
        roots, register: register || Omml::Configuration.context_id,
               value_declarations: declarations
      )
    end

    # Native bindings remain separate from declaration bytes.
    def native_bindings(bundle)
      declarations = enum_declarations
      bundle.value_types.to_h do |id, definition|
        [id, verified_binding(id, definition, declarations)]
      end
    end

    def require_registry!
      require "lutaml/model/lml"
      raise UnsupportedRuntime, REQUIRED_RUNTIME unless registry_available?
    rescue LoadError => e
      raise unless e.path == "lutaml/model/lml"

      raise UnsupportedRuntime, REQUIRED_RUNTIME
    end

    def registry_available?
      defined?(Lutaml::Model::Lml::ValueDeclarations) &&
        Lutaml::Model::Lml::ValueDeclarations::VERSION == REGISTRY_VERSION
    end

    def enum_definition(klass)
      { "base" => "string",
        "facets" => { "enumeration" => klass::VALUES.dup } }
    end

    def enum_types_by_name
      ENUM_TYPES.to_h do |name|
        klass = Omml::Models.const_get(name, false)
        [klass.name, klass]
      end
    end

    def verified_binding(id, definition, declarations)
      klass = enum_types_by_name[id.split("@", 2).first]
      unless klass && definition == declarations.fetch(klass)
        raise Lutaml::Model::Lml::RejectedError.new(
          :missing_type_binding, nil, "unverified scalar binding: #{id}"
        )
      end
      klass
    end

    def declaration_manifest
      manifest = JSON.parse(File.binread(File.join(DIRECTORY,
                                                   "manifest.json")))
      unless manifest["manifest"] == 1
        raise UnsupportedRuntime, "unsupported OMML declaration manifest"
      end

      manifest
    end

    private_class_method :require_registry!, :registry_available?,
                         :enum_definition, :enum_types_by_name,
                         :verified_binding, :declaration_manifest
  end
end
