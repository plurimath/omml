# frozen_string_literal: true

module Omml
  module Models
    class STPTabAlignment < EnumString
      VALUES = %w[
        left
        center
        right
      ].freeze
    end

    Omml::Configuration.register_model(STPTabAlignment)
  end
end
