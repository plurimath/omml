# frozen_string_literal: true

module Omml
  module Models
    class STFType < EnumString
      VALUES = %w[
        bar
        skw
        lin
        noBar
      ].freeze
    end

    Omml::Configuration.register_model(STFType)
  end
end
