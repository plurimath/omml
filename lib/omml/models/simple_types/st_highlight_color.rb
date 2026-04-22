# frozen_string_literal: true

module Omml
  module Models
    class STHighlightColor < EnumString
      VALUES = %w[
        black
        blue
        cyan
        green
        magenta
        red
        yellow
        white
        darkBlue
        darkCyan
        darkGreen
        darkMagenta
        darkRed
        darkYellow
        darkGray
        lightGray
        none
      ].freeze
    end

    Omml::Configuration.register_model(STHighlightColor)
  end
end
