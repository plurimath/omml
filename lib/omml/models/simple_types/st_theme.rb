# frozen_string_literal: true

module Omml
  module Models
    class STTheme < EnumString
      VALUES = %w[
        majorEastAsia
        majorBidi
        majorAscii
        majorHAnsi
        minorEastAsia
        minorBidi
        minorAscii
        minorHAnsi
      ].freeze
    end

    Omml::Configuration.register_model(STTheme)
  end
end
