# frozen_string_literal: true

module Omml
  module Configuration
    # Extended only by Omml::Configuration together with the sibling modules.
    module Adapter
      def adapter
        Lutaml::Model::Config.xml_adapter_type
      end

      def adapter=(_adapter)
        # No-op: omml is not user-facing and must not change the global
        # adapter. Adapter resolution is handled by AdapterResolver.
      end

      def xml_adapter
        Lutaml::Model::Config.adapter_for(:xml)
      end
    end
  end
end
