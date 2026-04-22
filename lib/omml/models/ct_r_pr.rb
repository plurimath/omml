# frozen_string_literal: true

module Omml
  module Models
    class CTRPr < Lutaml::Model::Serializable
      import_model_attributes :eg_r_pr_content

      xml do
        element "CT_RPr"

        namespace Omml::WordprocessingNamespace

        sequence do
          import_model_mappings :eg_r_pr_content
        end
      end
    end

    Omml::Configuration.register_model(CTRPr)
  end
end
