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

    Omml::Configuration.register_model(STBreakBin)
  end
end
