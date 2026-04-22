# frozen_string_literal: true

module Omml
  module Models
    class STInteger2 < Lutaml::Model::Type::Integer
      def self.cast(value, options = {})
        return if value.nil?

        super(value, options.merge(max: 2, min: -2))
      end
    end

    Omml::Configuration.register_model(STInteger2)
  end
end
