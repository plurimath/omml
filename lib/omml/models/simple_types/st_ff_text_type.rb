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
  end
end
