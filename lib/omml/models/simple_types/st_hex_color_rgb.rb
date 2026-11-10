# frozen_string_literal: true

module Omml
  module Models
    class STHexColorRGB < HexBinary
    end
    Omml::Configuration.register_model(STHexColorRGB, id: :st_hex_color_rgb)
  end
end
