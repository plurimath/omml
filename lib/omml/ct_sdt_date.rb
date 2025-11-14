# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_lang"
require_relative "ct_sdt_date_mapping_type"
require_relative "ct_calendar_type"
require_relative "st_date_time"
class CTSdtDate < Lutaml::Model::Serializable
  attribute :date_format, :ct_string, collection: 0..1
  attribute :lid, :ct_lang, collection: 0..1
  attribute :store_mapped_data_as, :ct_sdt_date_mapping_type, collection: 0..1
  attribute :calendar, :ct_calendar_type, collection: 0..1
  attribute :full_date, :st_date_time

  xml do
    root "SdtDate"

    sequence do
      map_element :dateFormat, to: :date_format
      map_element :lid, to: :lid
      map_element :storeMappedDataAs, to: :store_mapped_data_as
      map_element :calendar, to: :calendar
    end
    map_attribute :fullDate, to: :full_date
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_date)
  end
end

CTSdtDate.register_class_with_id
