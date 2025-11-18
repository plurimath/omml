# frozen_string_literal: true

require "lutaml/model"
require_relative "st_long_hex_number"
class CTFontSig < Lutaml::Model::Serializable
  attribute :usb0, :st_long_hex_number
  attribute :usb1, :st_long_hex_number
  attribute :usb2, :st_long_hex_number
  attribute :usb3, :st_long_hex_number
  attribute :csb0, :st_long_hex_number
  attribute :csb1, :st_long_hex_number

  xml do
    root "FontSig"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :usb0, to: :usb0
    map_attribute :usb1, to: :usb1
    map_attribute :usb2, to: :usb2
    map_attribute :usb3, to: :usb3
    map_attribute :csb0, to: :csb0
    map_attribute :csb1, to: :csb1
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_font_sig)
  end
end

CTFontSig.register_class_with_id
