# frozen_string_literal: true

module Omml
  module Models
    class CTAcc < Base
      attribute :acc_pr, :ct_acc_pr, collection: 0..1
      attribute :e, :ct_o_math_arg

      xml do
        element "CT_Acc"

        namespace Omml::Namespace

        sequence do
          map_element :accPr, to: :acc_pr
          map_element :e, to: :e, render_empty: true
        end
      end
    end
  end
end
