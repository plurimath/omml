# frozen_string_literal: true

require "lutaml/model"
require_relative "st_hex_color"
require_relative "st_theme_color"
require_relative "st_uchar_hex_number"
class CTColor < Lutaml::Model::Serializable
  attribute :val, :st_hex_color
  attribute :theme_color, :st_theme_color
  attribute :theme_tint, :st_uchar_hex_number
  attribute :theme_shade, :st_uchar_hex_number

  xml do
    root "Color"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
    map_attribute :themeColor, to: :theme_color
    map_attribute :themeTint, to: :theme_tint
    map_attribute :themeShade, to: :theme_shade
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_color)
  end
end

CTColor.register_class_with_id
