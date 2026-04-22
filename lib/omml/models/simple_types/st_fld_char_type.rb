# frozen_string_literal: true

module Omml
  module Models
    class STFldCharType < EnumString
      VALUES = %w[
        begin
        separate
        end
      ].freeze
    end

    Omml::Configuration.register_model(STFldCharType)
  end
end
