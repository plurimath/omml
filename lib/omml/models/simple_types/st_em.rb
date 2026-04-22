# frozen_string_literal: true

module Omml
  module Models
    class STEm < EnumString
      VALUES = %w[
        none
        dot
        comma
        circle
        underDot
      ].freeze
    end

    Omml::Configuration.register_model(STEm)
  end
end
