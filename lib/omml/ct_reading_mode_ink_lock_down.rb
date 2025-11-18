# frozen_string_literal: true

require "lutaml/model"
require_relative "st_on_off"
require_relative "st_pixels_measure"
require_relative "st_decimal_number"
class CTReadingModeInkLockDown < Lutaml::Model::Serializable
  attribute :actual_pg, :st_on_off
  attribute :w, :st_pixels_measure
  attribute :h, :st_pixels_measure
  attribute :font_sz, :st_decimal_number

  xml do
    root "ReadingModeInkLockDown"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :actualPg, to: :actual_pg
    map_attribute :w, to: :w
    map_attribute :h, to: :h
    map_attribute :fontSz, to: :font_sz
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_reading_mode_ink_lock_down)
  end
end

CTReadingModeInkLockDown.register_class_with_id
