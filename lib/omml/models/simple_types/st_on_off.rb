# frozen_string_literal: true

module Omml
  module Models
    class STOnOff < EnumString
      VALUES = %w[
        0
        1
        on
        off
        true
        false
      ].freeze
    end

    Omml::Configuration.register_model(STOnOff)
  end
end
