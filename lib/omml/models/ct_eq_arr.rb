# frozen_string_literal: true

module Omml
  module Models
    class CTEqArr < Lutaml::Model::Serializable
      attribute :eq_arr_pr, :ct_eq_arr_pr, collection: 0..1
      attribute :e, :ct_o_math_arg, collection: 1..Float::INFINITY

      xml do
        element "CT_EqArr"

        namespace Omml::Namespace

        sequence do
          map_element :eqArrPr, to: :eq_arr_pr
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTEqArr)
  end
end
