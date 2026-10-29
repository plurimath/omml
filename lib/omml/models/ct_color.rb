# frozen_string_literal: true

module Omml
  module Models
    class CTColor < Base
      attribute :val, :st_hex_color
      attribute :theme_color, :st_theme_color
      attribute :theme_tint, :st_uchar_hex_number
      attribute :theme_shade, :st_uchar_hex_number

      xml do
        element "CT_Color"

        namespace Omml::Namespace

        map_attribute :val, to: :val
        map_attribute :themeColor, to: :theme_color
        map_attribute :themeTint, to: :theme_tint
        map_attribute :themeShade, to: :theme_shade
      end
    end
  end
end
