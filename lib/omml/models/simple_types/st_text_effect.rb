# frozen_string_literal: true

module Omml
  module Models
    class STTextEffect < EnumString
      VALUES = %w[
        blinkBackground
        lights
        antsBlack
        antsRed
        shimmer
        sparkle
        none
      ].freeze
    end

    Omml::Configuration.register_model(STTextEffect)
  end
end
