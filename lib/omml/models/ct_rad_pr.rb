# frozen_string_literal: true

module Omml
  module Models
    class CTRadPr < Lutaml::Model::Serializable
      attribute :deg_hide, :ct_on_off, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_RadPr"

        namespace Omml::Namespace

        sequence do
          map_element :degHide, to: :deg_hide
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTRadPr)
  end
end
