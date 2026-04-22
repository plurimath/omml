# frozen_string_literal: true

module Omml
  module Models
    class CTCustomXmlPr < Lutaml::Model::Serializable
      attribute :placeholder, :ct_string, collection: 0..1
      attribute :attr, :ct_attr, collection: 0..Float::INFINITY

      xml do
        element "CT_CustomXmlPr"

        namespace Omml::Namespace

        sequence do
          map_element :placeholder, to: :placeholder
          map_element :attr, to: :attr
        end
      end
    end

    Omml::Configuration.register_model(CTCustomXmlPr)
  end
end
