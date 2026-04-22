# frozen_string_literal: true

module Omml
  module Models
    class STXAlign < EnumString
      VALUES = %w[
        left
        center
        right
      ].freeze
    end

    Omml::Configuration.register_model(STXAlign)
  end
end
