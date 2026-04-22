# frozen_string_literal: true

module Omml
  module Models
    class CTSdtDate < Lutaml::Model::Serializable
      attribute :date_format, :ct_string, collection: 0..1
      attribute :lid, :ct_lang, collection: 0..1
      attribute :store_mapped_data_as, :ct_sdt_date_mapping_type,
                collection: 0..1
      attribute :calendar, :ct_calendar_type, collection: 0..1
      attribute :full_date, :st_date_time

      xml do
        element "CT_SdtDate"

        namespace Omml::Namespace

        sequence do
          map_element :dateFormat, to: :date_format
          map_element :lid, to: :lid
          map_element :storeMappedDataAs, to: :store_mapped_data_as
          map_element :calendar, to: :calendar
        end
        map_attribute :fullDate, to: :full_date
      end
    end

    Omml::Configuration.register_model(CTSdtDate)
  end
end
