# frozen_string_literal: true

module Omml
  module Models
    class STVerticalAlignRun < EnumString
      VALUES = %w[
        baseline
        superscript
        subscript
      ].freeze
    end

    Omml::Configuration.register_model(STVerticalAlignRun)
  end
end
