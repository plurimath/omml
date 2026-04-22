# frozen_string_literal: true

module Omml
  module Models
    class STFFTextType < EnumString
      VALUES = %w[
        regular
        number
        date
        currentTime
        currentDate
        calculated
      ].freeze
    end

    Omml::Configuration.register_model(STFFTextType)
  end
end
