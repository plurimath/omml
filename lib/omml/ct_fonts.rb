# frozen_string_literal: true

require "lutaml/model"
require_relative "st_hint"
require_relative "st_string"
require_relative "st_theme"
class CTFonts < Lutaml::Model::Serializable
  attribute :hint, :st_hint
  attribute :ascii, :st_string
  attribute :h_ansi, :st_string
  attribute :east_asia, :st_string
  attribute :cs, :st_string
  attribute :ascii_theme, :st_theme
  attribute :h_ansi_theme, :st_theme
  attribute :east_asia_theme, :st_theme
  attribute :cstheme, :st_theme

  xml do
    root "Fonts"

    map_attribute :hint, to: :hint
    map_attribute :ascii, to: :ascii
    map_attribute :hAnsi, to: :h_ansi
    map_attribute :eastAsia, to: :east_asia
    map_attribute :cs, to: :cs
    map_attribute :asciiTheme, to: :ascii_theme
    map_attribute :hAnsiTheme, to: :h_ansi_theme
    map_attribute :eastAsiaTheme, to: :east_asia_theme
    map_attribute :cstheme, to: :cstheme
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_fonts)
  end
end

CTFonts.register_class_with_id
