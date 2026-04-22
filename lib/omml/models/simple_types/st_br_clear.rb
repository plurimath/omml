# frozen_string_literal: true

module Omml
  module Models
    class STBrClear < EnumString
      VALUES = %w[
        none
        left
        right
        all
      ].freeze
    end

    Omml::Configuration.register_model(STBrClear)
  end
end
