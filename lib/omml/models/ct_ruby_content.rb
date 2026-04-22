# frozen_string_literal: true

module Omml
  module Models
    class CTRubyContent < Lutaml::Model::Serializable
      import_model_attributes :eg_ruby_content

      xml do
        element "CT_RubyContent"

        namespace Omml::Namespace

        import_model_mappings :eg_ruby_content
      end
    end

    Omml::Configuration.register_model(CTRubyContent)
  end
end
