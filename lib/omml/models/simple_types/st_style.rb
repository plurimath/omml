# frozen_string_literal: true

module Omml
  module Models
    class STStyle < EnumString
      VALUES = %w[
        p
        b
        i
        bi
      ].freeze
    end
  end
end
