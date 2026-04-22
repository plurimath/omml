# frozen_string_literal: true

module Omml
  module Models
    class STUnderline < EnumString
      VALUES = %w[
        single
        words
        double
        thick
        dotted
        dottedHeavy
        dash
        dashedHeavy
        dashLong
        dashLongHeavy
        dotDash
        dashDotHeavy
        dotDotDash
        dashDotDotHeavy
        wave
        wavyHeavy
        wavyDouble
        none
      ].freeze
    end

    Omml::Configuration.register_model(STUnderline)
  end
end
