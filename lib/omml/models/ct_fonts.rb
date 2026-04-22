# frozen_string_literal: true

module Omml
  module Models
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
        element "rFonts"

        namespace Omml::WordprocessingNamespace

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
    end

    Omml::Configuration.register_model(CTFonts)
  end
end
