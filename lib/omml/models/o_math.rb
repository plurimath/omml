# frozen_string_literal: true

module Omml
  module Models
    # Root element wrapper for the generated CTOMath content model.
    class OMath < Base
      import_model_attributes :eg_o_math_elements

      xml do
        element "oMath"
        namespace Omml::Namespace
        ordered
        sequence do
          import_model_mappings :eg_o_math_elements
        end
      end
    end
  end
end
