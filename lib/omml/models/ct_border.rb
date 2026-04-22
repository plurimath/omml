# frozen_string_literal: true

module Omml
  module Models
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
        element "CT_Border"

        namespace Omml::Namespace

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
    end

    Omml::Configuration.register_model(CTBorder)
  end
end
