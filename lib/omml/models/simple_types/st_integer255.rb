# frozen_string_literal: true

module Omml
  module Models
    class STInteger255 < Lutaml::Model::Type::Integer
      def self.cast(value, options = {})
        return if value.nil?

        super(value, options.merge(max: 255, min: 1))
      end
    end

    Omml::Configuration.register_model(STInteger255)
  end
end
