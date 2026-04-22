# frozen_string_literal: true

module Omml
  module Models
    class CTSmartTagRun < Lutaml::Model::Serializable
      attribute :smart_tag_pr, :ct_smart_tag_pr, collection: 0..1
      import_model_attributes :eg_p_content
      attribute :uri, :st_string
      attribute :element, :st_string

      xml do
        element "CT_SmartTagRun"

        namespace Omml::Namespace

        sequence do
          map_element :smartTagPr, to: :smart_tag_pr
          import_model_mappings :eg_p_content
        end
        map_attribute :uri, to: :uri
        map_attribute :element, to: :element
      end
    end

    Omml::Configuration.register_model(CTSmartTagRun)
  end
end
