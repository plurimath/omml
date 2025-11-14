# frozen_string_literal: true

require "lutaml/model"
require_relative "st_border"
require_relative "st_hex_color"
require_relative "st_theme_color"
require_relative "st_uchar_hex_number"
require_relative "st_eighth_point_measure"
require_relative "st_point_measure"
require_relative "st_on_off"
class CTBorder < Lutaml::Model::Serializable
  attribute :val, :st_border
  attribute :color, :st_hex_color
  attribute :theme_color, :st_theme_color
  attribute :theme_tint, :st_uchar_hex_number
  attribute :theme_shade, :st_uchar_hex_number
  attribute :sz, :st_eighth_point_measure
  attribute :space, :st_point_measure
  attribute :shadow, :st_on_off
  attribute :frame, :st_on_off

  xml do
    root "Border"

    map_attribute :val, to: :val
    map_attribute :color, to: :color
    map_attribute :themeColor, to: :theme_color
    map_attribute :themeTint, to: :theme_tint
    map_attribute :themeShade, to: :theme_shade
    map_attribute :sz, to: :sz
    map_attribute :space, to: :space
    map_attribute :shadow, to: :shadow
    map_attribute :frame, to: :frame
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_border)
  end
end

CTBorder.register_class_with_id
