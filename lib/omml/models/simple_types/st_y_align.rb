# frozen_string_literal: true

module Omml
  module Models
    class STYAlign < EnumString
      VALUES = %w[
        top
        center
        bot
      ].freeze
    end

    Omml::Configuration.register_model(STYAlign)
  end
end
