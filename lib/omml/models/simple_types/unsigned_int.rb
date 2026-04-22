# frozen_string_literal: true

module Omml
  module Models
    class UnsignedInt < Lutaml::Model::Type::Integer
      def self.cast(value, options = {})
        return if value.nil?

        super(value, options.merge(max: 4_294_967_295, min: 0))
      end
    end

    Omml::Configuration.register_model(UnsignedInt)
  end
end
