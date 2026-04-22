# frozen_string_literal: true

module Omml
  module Models
    class STHint < EnumString
      VALUES = %w[
        default
        eastAsia
        cs
      ].freeze
    end

    Omml::Configuration.register_model(STHint)
  end
end
