# frozen_string_literal: true

module Omml
  module Models
    class CTAccPr < Base
      attribute :chr, :ct_char, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_AccPr"

        namespace Omml::Namespace

        sequence do
          map_element :chr, to: :chr
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end
  end
end
