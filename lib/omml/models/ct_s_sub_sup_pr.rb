# frozen_string_literal: true

module Omml
  module Models
    class CTSSubSupPr < Lutaml::Model::Serializable
      attribute :aln_scr, :ct_on_off, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_SSubSupPr"

        namespace Omml::Namespace

        sequence do
          map_element :alnScr, to: :aln_scr
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTSSubSupPr)
  end
end
