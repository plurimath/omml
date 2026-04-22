# frozen_string_literal: true

module Omml
  module Models
    class CTMarkupRange < CTMarkup
      attribute :displaced_by_custom_xml, :st_displaced_by_custom_xml

      xml do
        element "CT_MarkupRange"

        namespace Omml::Namespace

        map_attribute :displacedByCustomXml, to: :displaced_by_custom_xml
      end
    end

    Omml::Configuration.register_model(CTMarkupRange)
  end
end
