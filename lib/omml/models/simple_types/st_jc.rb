# frozen_string_literal: true

module Omml
  module Models
    class STJc < EnumString
      VALUES = %w[
        left
        right
        center
        centerGroup
      ].freeze
    end

    Omml::Configuration.register_model(STJc)
  end
end
