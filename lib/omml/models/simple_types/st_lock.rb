# frozen_string_literal: true

module Omml
  module Models
    class STLock < EnumString
      VALUES = %w[
        sdtLocked
        contentLocked
        unlocked
        sdtContentLocked
      ].freeze
    end
  end
end
