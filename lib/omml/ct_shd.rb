# frozen_string_literal: true

require "lutaml/model"
require_relative "st_shd"
require_relative "st_hex_color"
require_relative "st_theme_color"
require_relative "st_uchar_hex_number"
class CTShd < Lutaml::Model::Serializable
  attribute :val, :st_shd
  attribute :color, :st_hex_color
  attribute :theme_color, :st_theme_color
  attribute :theme_tint, :st_uchar_hex_number
  attribute :theme_shade, :st_uchar_hex_number
  attribute :fill, :st_hex_color
  attribute :theme_fill, :st_theme_color
  attribute :theme_fill_tint, :st_uchar_hex_number
  attribute :theme_fill_shade, :st_uchar_hex_number

  xml do
    root "Shd"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
    map_attribute :color, to: :color
    map_attribute :themeColor, to: :theme_color
    map_attribute :themeTint, to: :theme_tint
    map_attribute :themeShade, to: :theme_shade
    map_attribute :fill, to: :fill
    map_attribute :themeFill, to: :theme_fill
    map_attribute :themeFillTint, to: :theme_fill_tint
    map_attribute :themeFillShade, to: :theme_fill_shade
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_shd)
  end
end

CTShd.register_class_with_id
