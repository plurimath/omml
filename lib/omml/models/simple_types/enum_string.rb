# frozen_string_literal: true

module Omml
  module Models
    class EnumString < Lutaml::Model::Type::String
      def self.cast(value, options = {})
        return if value.nil?

        values = defined_values
        return super unless values

        cast_options = options_with_values(options) do
          values.map do |entry|
            super(entry)
          end
        end

        super(value, cast_options)
      end

      def self.defined_values
        const_get(:VALUES, false) if const_defined?(:VALUES, false)
      end
      private_class_method :defined_values

      def self.memoized_values
        @memoized_values ||= yield
      end

      def self.options_with_values(options, &block)
        options.dup.tap do |cast_options|
          cast_options[:values] ||= memoized_values(&block)
        end
      end

      private_class_method :memoized_values
      private_class_method :options_with_values
    end

    Omml::Configuration.register_model(EnumString)
  end
end
