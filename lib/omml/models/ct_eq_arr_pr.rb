# frozen_string_literal: true

module Omml
  module Models
    class CTEqArrPr < Lutaml::Model::Serializable
      attribute :base_jc, :ct_y_align, collection: 0..1
      attribute :max_dist, :ct_on_off, collection: 0..1
      attribute :obj_dist, :ct_on_off, collection: 0..1
      attribute :r_sp_rule, :ct_spacing_rule, collection: 0..1
      attribute :r_sp, :ct_un_signed_integer, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_EqArrPr"

        namespace Omml::Namespace

        sequence do
          map_element :baseJc, to: :base_jc
          map_element :maxDist, to: :max_dist
          map_element :objDist, to: :obj_dist
          map_element :rSpRule, to: :r_sp_rule
          map_element :rSp, to: :r_sp
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTEqArrPr)
  end
end
