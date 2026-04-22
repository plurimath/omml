# frozen_string_literal: true

module Omml
  module Models
    class STWrapText < Token
      VALUES = %w[
        bothSides
        left
        right
        largest
      ].freeze
    end

    Omml::Configuration.register_model(STWrapText)
  end
end
