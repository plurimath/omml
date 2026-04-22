# frozen_string_literal: true

module Omml
  module Models
    class STShp < EnumString
      VALUES = %w[
        centered
        match
      ].freeze
    end

    Omml::Configuration.register_model(STShp)
  end
end
