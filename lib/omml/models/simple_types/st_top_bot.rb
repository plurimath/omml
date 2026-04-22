# frozen_string_literal: true

module Omml
  module Models
    class STTopBot < EnumString
      VALUES = %w[
        top
        bot
      ].freeze
    end

    Omml::Configuration.register_model(STTopBot)
  end
end
