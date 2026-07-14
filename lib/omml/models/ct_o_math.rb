# frozen_string_literal: true

module Omml
  module Models
    class CTOMath < Base
      import_model_attributes :eg_o_math_elements

      xml do
        element "CT_OMath"

        namespace Omml::Namespace
        ordered

        sequence do
          import_model_mappings :eg_o_math_elements
        end
      end
    end
  end
end
