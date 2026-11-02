# frozen_string_literal: true

module Omml
  module Models
    class STRubyAlign < EnumString
      VALUES = %w[
        center
        distributeLetter
        distributeSpace
        left
        right
        rightVertical
      ].freeze
    end
  end
end
