# frozen_string_literal: true

module Omml
  module Models
    class Token < Lutaml::Model::Type::String
      TOKEN_PATTERN = /(?-mix:\A[^\t\n\f\r ]+(?: [^\t\n\f\r ]+)*\z)/

      def self.cast(value, options = {})
        return if value.nil?

        cast_options = options.merge(pattern: TOKEN_PATTERN)
        values = defined_values
        if values
          cast_options[:values] ||= memoized_values do
            values.map { |entry| super(entry, pattern: TOKEN_PATTERN) }
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
      private_class_method :memoized_values
    end

    Omml::Configuration.register_model(Token)
  end
end
