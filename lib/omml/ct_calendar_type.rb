# frozen_string_literal: true

require "lutaml/model"
require_relative "st_calendar_type"
class CTCalendarType < Lutaml::Model::Serializable
  attribute :val, :st_calendar_type

  xml do
    root "CalendarType"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_calendar_type)
  end
end

CTCalendarType.register_class_with_id
