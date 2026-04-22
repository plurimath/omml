# frozen_string_literal: true

module Omml
  module Models
    class CTTextScale < Lutaml::Model::Serializable
      attribute :val, :st_text_scale

      xml do
        element "CT_TextScale"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTTextScale)
  end
end
