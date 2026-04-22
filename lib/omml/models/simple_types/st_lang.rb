# frozen_string_literal: true

module Omml
  module Models
    class STLang < Lutaml::Model::Type::Value
      def self.cast(value, options = {})
        return if value.nil?

        cast_value(:st_lang_code, value, options) ||
          cast_value(:st_string, value, options)
      end

      def self.cast_value(type_name, value, options)
        Lutaml::Model::GlobalContext
          .resolve_type(type_name, @register)
          .cast(value, options)
      end

      private_class_method :cast_value
    end

    Omml::Configuration.register_model(STLang)
  end
end
