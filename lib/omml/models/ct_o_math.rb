# frozen_string_literal: true

module Omml
  module Models
    class CTOMath < Lutaml::Model::Serializable
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

    Omml::Configuration.register_model(CTOMath)
  end
end
