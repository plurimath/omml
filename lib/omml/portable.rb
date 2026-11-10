# frozen_string_literal: true

if RUBY_ENGINE != "opal"
  require "json"
  require "digest"
end

module Omml
  # Only explicitly verified scalar declarations participate in this registry.
  module Portable
    REGISTRY_VERSION = 1
    DIRECTORY = if RUBY_ENGINE != "opal"
                  File.expand_path("../../model/portable", __dir__).freeze
                end
    ENUM_TYPES = %i[
      STAlignH STAlignV STBorder STBrClear
      STBrType STBreakBin STBreakBinSub STCalendarType
      STCombineBrackets STDisplacedByCustomXml STEdGrp STEm
      STFFTextType STFType STFldCharType STHighlightColor
      STHint STInfoTextType STJc STLimLoc
      STLock STOnOff STPTabAlignment STPTabLeader
      STPTabRelativeTo STProofErr STRelFromH STRelFromV
      STRubyAlign STScript STSdtDateMappingType STShd
      STShp STStyle STTextEffect STTheme
      STThemeColor STTopBot STUnderline STVerticalAlignRun
      STWrapText STXAlign STYAlign
    ].freeze
    INTEGER_BOUNDS = {
      UnsignedInt: [0, 4_294_967_295].freeze,
      UnsignedLong: [0, 18_446_744_073_709_551_615].freeze,
      STInteger2: [-2, 2].freeze,
      STInteger255: [1, 255].freeze,
      STSpacingRule: [0, 4].freeze,
      STTextScale: [0, 600].freeze,
    }.freeze
    DECIMAL_BOUNDS = {
      STCoordinate: [-27_273_042_329_600, 27_273_042_316_900].freeze,
      STPositiveCoordinate: [0, 27_273_042_316_900].freeze,
    }.freeze
    REQUIRED_RUNTIME = "portable scalar export requires " \
                       "named-value declaration registry version 1"

    class UnsupportedRuntime < StandardError; end

    module_function

    def model_declarations(graph = "enum-subset-v1")
      unless DIRECTORY
        raise UnsupportedRuntime,
              "load model declarations through the target runtime"
      end

      entry = declaration_manifest.fetch("graphs").fetch(graph)
      bytes = File.binread(File.join(DIRECTORY, entry.fetch("file")))
      unless Digest::SHA256.hexdigest(bytes) == entry.fetch("sha256")
        raise UnsupportedRuntime, "OMML model declaration checksum mismatch"
      end

      JSON.parse(bytes)
    end

    def enum_declarations
      require_registry!
      make_registry(enum_entries)
    end

    def value_declarations
      require_registry!
      make_registry(value_entries)
    end

    def export_bundle(roots, register: nil)
      declarations = value_declarations
      Omml::Models.eager_load!
      Omml::Configuration.populate_context! unless Omml::Configuration.context
      Lutaml::Model::Lml.export_bundle(
        roots, register: register || Omml::Configuration.context_id,
               value_declarations: declarations
      )
    end

    # Native bindings remain separate from declaration bytes.
    def native_bindings(bundle)
      require_registry!
      entries = value_entries
      declarations = make_registry(entries)
      classes = entries.keys.to_h { |klass| [klass.name, klass] }
      bundle.value_types.to_h do |id, definition|
        klass = classes[id.split("@", 2).first]
        [id, verified_binding(id, definition, declarations, klass)]
      end
    end

    def require_registry!
      if RUBY_ENGINE == "opal"
        raise UnsupportedRuntime, REQUIRED_RUNTIME
      else
        require "lutaml/model/lml"
      end

      raise UnsupportedRuntime, REQUIRED_RUNTIME unless registry_available?
    rescue LoadError => e
      raise unless e.path == "lutaml/model/lml"

      raise UnsupportedRuntime, REQUIRED_RUNTIME
    end

    def registry_available?
      defined?(Lutaml::Model::Lml::ValueDeclarations) &&
        Lutaml::Model::Lml::ValueDeclarations::VERSION == REGISTRY_VERSION
    end

    def make_registry(entries)
      Lutaml::Model::Lml::ValueDeclarations.new(entries,
                                                version: REGISTRY_VERSION)
    end

    def enum_entries
      entries = ENUM_TYPES.to_h do |name|
        klass = Omml::Models.const_get(name, false)
        # The native String validator accepts empty strings before enum checks.
        [klass, enum_definition([*klass::VALUES, ""])]
      end
      entries[Lutaml::Xml::W3c::XmlSpaceType] =
        enum_definition(%w[default preserve])
      entries
    end

    def enum_definition(values)
      { "base" => "string", "facets" => { "enumeration" => values.dup } }
    end

    def value_entries
      enum_entries
        .merge(numeric_entries(INTEGER_BOUNDS, "integer"))
        .merge(numeric_entries(DECIMAL_BOUNDS, "decimal"))
        .merge(string_entries)
    end

    def numeric_entries(bounds, base)
      bounds.to_h do |name, (min, max)|
        klass = Omml::Models.const_get(name, false)
        [klass, {
          "base" => base,
          "facets" => {
            "min_inclusive" => min.to_s,
            "max_inclusive" => max.to_s,
            "source_binding_v1" => true,
          },
        }]
      end
    end

    def string_entries
      # HexBinary's native pattern matches every String, including empty.
      # The restored STLangCode alias uses exactly that String cast.
      transparent = { "base" => "string", "facets" => {} }
      {
        Omml::Models::HexBinary => transparent,
        Omml::Models::STLang => transparent,
        Omml::Models::STHexColor => enum_definition(["auto", ""]),
        Omml::Models::Token => {
          "base" => "string", "facets" => { "source_binding_v1" => true }
        },
      }
    end

    def verified_binding(id, definition, declarations, klass)
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
                         :make_registry, :enum_entries, :enum_definition,
                         :value_entries, :numeric_entries, :string_entries,
                         :verified_binding, :declaration_manifest
  end
end
