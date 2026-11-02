# frozen_string_literal: true

module Omml
  module Models
    class STBreakBin < EnumString
      VALUES = %w[
        before
        after
        repeat
      ].freeze
    end
  end
end
