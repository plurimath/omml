# frozen_string_literal: true

module Omml
  module Models
    class CTCtrlPr < Base
      import_model_attributes :eg_r_pr_math

      xml do
        element "CT_CtrlPr"

        namespace Omml::Namespace

        sequence do
          import_model_mappings :eg_r_pr_math
        end
      end
    end
  end
end
