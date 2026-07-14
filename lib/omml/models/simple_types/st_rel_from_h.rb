# frozen_string_literal: true

module Omml
  module Models
    class STRelFromH < Token
      VALUES = %w[
        margin
        page
        column
        character
        leftMargin
        rightMargin
        insideMargin
        outsideMargin
      ].freeze
    end
  end
end
