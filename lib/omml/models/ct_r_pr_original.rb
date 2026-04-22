# frozen_string_literal: true

module Omml
  module Models
    class CTRPrOriginal < Lutaml::Model::Serializable
      import_model_attributes :eg_r_pr_base

      xml do
        element "CT_RPrOriginal"

        namespace Omml::Namespace

        sequence do
          import_model_mappings :eg_r_pr_base
        end
      end
    end

    Omml::Configuration.register_model(CTRPrOriginal)
  end
end
