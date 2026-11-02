# frozen_string_literal: true

module Omml
  module Models
    class Base < Lutaml::Model::Serializable
      def self.inherited(subclass)
        super
        Omml::Configuration.register_model(subclass)
      end

      def self.lutaml_default_register
        Omml::Configuration.context_id
      end
    end
  end
end
