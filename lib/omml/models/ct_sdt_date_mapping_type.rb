# frozen_string_literal: true

module Omml
  module Models
    class CTSdtDateMappingType < Lutaml::Model::Serializable
      attribute :val, :st_sdt_date_mapping_type

      xml do
        element "CT_SdtDateMappingType"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTSdtDateMappingType)
  end
end
