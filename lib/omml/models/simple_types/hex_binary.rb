# frozen_string_literal: true

module Omml
  module Models
    class HexBinary < Lutaml::Model::Type::String
      PATTERN = /([0-9a-fA-F]{2})*/

      def self.cast(value, options = {})
        return if value.nil?

        super(value, options.merge(pattern: PATTERN))
      end
    end

    Omml::Configuration.register_model(HexBinary)
  end
end
