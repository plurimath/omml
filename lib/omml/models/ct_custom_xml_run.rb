# frozen_string_literal: true

module Omml
  module Models
    class CTCustomXmlRun < Lutaml::Model::Serializable
      attribute :custom_xml_pr, :ct_custom_xml_pr, collection: 0..1
      import_model_attributes :eg_p_content
      attribute :uri, :st_string
      attribute :element, :st_string

      xml do
        element "CT_CustomXmlRun"

        namespace Omml::Namespace

        sequence do
          map_element :customXmlPr, to: :custom_xml_pr
          import_model_mappings :eg_p_content
        end
        map_attribute :uri, to: :uri
        map_attribute :element, to: :element
      end
    end

    Omml::Configuration.register_model(CTCustomXmlRun)
  end
end
