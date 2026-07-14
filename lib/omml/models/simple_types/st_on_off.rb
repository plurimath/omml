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
  end
end
