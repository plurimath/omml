# frozen_string_literal: true

module Omml
  module Models
    class CTPerm < Lutaml::Model::Serializable
      attribute :id, :st_string
      attribute :displaced_by_custom_xml, :st_displaced_by_custom_xml

      xml do
        element "CT_Perm"

        namespace Omml::Namespace

        map_attribute :id, to: :id
        map_attribute :displacedByCustomXml, to: :displaced_by_custom_xml
      end
    end

    Omml::Configuration.register_model(CTPerm)
  end
end
