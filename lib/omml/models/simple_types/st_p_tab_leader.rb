# frozen_string_literal: true

module Omml
  module Models
    class STPTabLeader < EnumString
      VALUES = %w[
        none
        dot
        hyphen
        underscore
        middleDot
      ].freeze
    end

    Omml::Configuration.register_model(STPTabLeader)
  end
end
