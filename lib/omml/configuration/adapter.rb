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
        configured_adapter = Lutaml::Model::Config.adapter_for(:xml)
        return configured_adapter if configured_adapter

        raise Omml::Errors::XmlAdapterNotConfiguredError
      end
    end
  end
end
