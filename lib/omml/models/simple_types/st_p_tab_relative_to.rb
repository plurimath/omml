# frozen_string_literal: true

module Omml
  module Models
    class STPTabRelativeTo < EnumString
      VALUES = %w[
        margin
        indent
      ].freeze
    end
  end
end
