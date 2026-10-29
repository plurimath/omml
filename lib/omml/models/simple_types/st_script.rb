# frozen_string_literal: true

module Omml
  module Models
    class STScript < EnumString
      VALUES = %w[
        roman
        script
        fraktur
        double-struck
        sans-serif
        monospace
      ].freeze
    end
  end
end
