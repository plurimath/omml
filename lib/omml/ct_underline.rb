# frozen_string_literal: true

require "lutaml/model"
require_relative "st_underline"
require_relative "st_hex_color"
require_relative "st_theme_color"
require_relative "st_uchar_hex_number"
class CTUnderline < Lutaml::Model::Serializable
  attribute :val, :st_underline
  attribute :color, :st_hex_color
  attribute :theme_color, :st_theme_color
  attribute :theme_tint, :st_uchar_hex_number
  attribute :theme_shade, :st_uchar_hex_number

  xml do
    root "Underline"

    map_attribute :val, to: :val
    map_attribute :color, to: :color
    map_attribute :themeColor, to: :theme_color
    map_attribute :themeTint, to: :theme_tint
    map_attribute :themeShade, to: :theme_shade
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_underline)
  end
end

CTUnderline.register_class_with_id
