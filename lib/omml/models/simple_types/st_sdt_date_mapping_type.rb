# frozen_string_literal: true

module Omml
  module Models
    class STSdtDateMappingType < EnumString
      VALUES = %w[
        text
        date
        dateTime
      ].freeze
    end

    Omml::Configuration.register_model(STSdtDateMappingType)
  end
end
