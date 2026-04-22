# frozen_string_literal: true

module Omml
  module Models
    class STHexColor < Lutaml::Model::Type::Value
      def self.cast(value, options = {})
        return if value.nil?

        cast_value(:st_hex_color_auto, value, options) ||
          cast_value(:st_hex_color_rgb, value, options)
      end

      def self.cast_value(type_name, value, options)
        Lutaml::Model::GlobalContext
          .resolve_type(type_name, @register)
          .cast(value, options)
      end

      private_class_method :cast_value
    end

    Omml::Configuration.register_model(STHexColor)
  end
end
