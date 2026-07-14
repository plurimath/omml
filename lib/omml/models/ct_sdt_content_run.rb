# frozen_string_literal: true

module Omml
  module Models
    class CTSdtContentRun < Base
      import_model_attributes :eg_p_content

      xml do
        element "CT_SdtContentRun"

        namespace Omml::Namespace

        import_model_mappings :eg_p_content
      end
    end
  end
end
