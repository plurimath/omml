# frozen_string_literal: true

module Omml
  module Models
    class STSpacingRule < Lutaml::Model::Type::Integer
      def self.cast(value, options = {})
        return if value.nil?

        super(value, options.merge(max: 4, min: 0))
      end
    end

    Omml::Configuration.register_model(STSpacingRule)
  end
end
