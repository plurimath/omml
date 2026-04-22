# frozen_string_literal: true

module Omml
  module Models
    class CTFPr < Lutaml::Model::Serializable
      attribute :type, :ct_f_type, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_FPr"

        namespace Omml::Namespace

        sequence do
          map_element :type, to: :type
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTFPr)
  end
end
