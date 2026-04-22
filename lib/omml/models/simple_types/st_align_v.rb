# frozen_string_literal: true

module Omml
  module Models
    class STAlignV < Token
      VALUES = %w[
        top
        bottom
        center
        inside
        outside
      ].freeze
    end

    Omml::Configuration.register_model(STAlignV)
  end
end
