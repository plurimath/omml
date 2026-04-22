# frozen_string_literal: true

module Omml
  module Models
    class CTSPrePr < Lutaml::Model::Serializable
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_SPrePr"

        namespace Omml::Namespace

        sequence do
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTSPrePr)
  end
end
