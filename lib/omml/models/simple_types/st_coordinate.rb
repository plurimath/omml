# frozen_string_literal: true

module Omml
  module Models
    class STCoordinate < Lutaml::Model::Type::Decimal
      def self.cast(value, options = {})
        return if value.nil?

        super(value, options.merge(max: 27_273_042_316_900,
                                   min: -27_273_042_329_600))
      end
    end

    Omml::Configuration.register_model(STCoordinate)
  end
end
