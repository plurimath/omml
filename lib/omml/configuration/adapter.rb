# frozen_string_literal: true

module Omml
  module Configuration
    # Extended only by Omml::Configuration together with the sibling modules.
    module Adapter
      def adapter
        Lutaml::Model::Config.xml_adapter_type
      end

      def adapter=(adapter)
        Lutaml::Model::Config.xml_adapter_type = adapter
      end

      def xml_adapter
        self.adapter = Omml.default_adapter unless adapter

        Lutaml::Model::Config.adapter_for(:xml)
      end
    end
  end
end
