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

    Omml::Configuration.register_model(STBreakBinSub)
  end
end
