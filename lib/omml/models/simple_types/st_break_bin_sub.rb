# frozen_string_literal: true

module Omml
  module Models
    class STBreakBinSub < EnumString
      VALUES = %w[
        --
        -+
        +-
      ].freeze
    end
  end
end
