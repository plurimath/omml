# frozen_string_literal: true

module Omml
  module Models
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
        element "CT_Shd"

        namespace Omml::Namespace

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
    end

    Omml::Configuration.register_model(CTShd)
  end
end
