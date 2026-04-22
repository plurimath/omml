# frozen_string_literal: true

module Omml
  module Models
    class UnsignedLong < Lutaml::Model::Type::Integer
      def self.cast(value, options = {})
        return if value.nil?

        super(value, options.merge(max: 18_446_744_073_709_551_615, min: 0))
      end
    end

    Omml::Configuration.register_model(UnsignedLong)
  end
end
