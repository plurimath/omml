# frozen_string_literal: true

module Omml
  module Models
    class STAlignH < Token
      VALUES = %w[
        left
        right
        center
        inside
        outside
      ].freeze
    end

    Omml::Configuration.register_model(STAlignH)
  end
end
