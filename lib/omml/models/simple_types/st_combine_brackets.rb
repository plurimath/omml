# frozen_string_literal: true

module Omml
  module Models
    class STCombineBrackets < EnumString
      VALUES = %w[
        none
        round
        square
        angle
        curly
      ].freeze
    end

    Omml::Configuration.register_model(STCombineBrackets)
  end
end
