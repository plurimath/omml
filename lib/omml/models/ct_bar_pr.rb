# frozen_string_literal: true

module Omml
  module Models
    class CTBarPr < Lutaml::Model::Serializable
      attribute :pos, :ct_top_bot, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_BarPr"

        namespace Omml::Namespace

        sequence do
          map_element :pos, to: :pos
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTBarPr)
  end
end
