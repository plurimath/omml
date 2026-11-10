# frozen_string_literal: true

module Omml
  module Models
    class STHexColorAuto < Lutaml::Model::Type::String
      def self.cast(value, options = {})
        return if value.nil?

        options[:values] = [super("auto")]
        super
      end
    end
    Omml::Configuration.register_model(STHexColorAuto, id: :st_hex_color_auto)
  end
end
