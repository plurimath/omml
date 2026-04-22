# frozen_string_literal: true

module Omml
  module Models
    class CTTextEffect < Lutaml::Model::Serializable
      attribute :val, :st_text_effect

      xml do
        element "CT_TextEffect"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTTextEffect)
  end
end
