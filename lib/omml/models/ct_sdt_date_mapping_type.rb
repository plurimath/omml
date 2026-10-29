# frozen_string_literal: true

module Omml
  module Models
    class CTSdtDateMappingType < Base
      attribute :val, :st_sdt_date_mapping_type

      xml do
        element "CT_SdtDateMappingType"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
