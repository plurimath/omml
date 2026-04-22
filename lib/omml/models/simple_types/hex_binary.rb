# frozen_string_literal: true

module Omml
  module Models
    class HexBinary < Lutaml::Model::Type::String
      def self.cast(value, options = {})
        return if value.nil?

        super(value, options.merge(pattern: /(?-mix:([0-9a-fA-F]{2})*)/))
      end
    end

    Omml::Configuration.register_model(HexBinary)
  end
end
