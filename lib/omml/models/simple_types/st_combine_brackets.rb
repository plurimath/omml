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
  end
end
