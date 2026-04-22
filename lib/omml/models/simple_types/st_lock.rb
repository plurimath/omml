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

    Omml::Configuration.register_model(STLock)
  end
end
