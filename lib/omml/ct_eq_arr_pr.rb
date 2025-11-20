# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_y_align"
require_relative "ct_on_off"
require_relative "ct_spacing_rule"
require_relative "ct_un_signed_integer"
require_relative "ct_ctrl_pr"
class CTEqArrPr < Lutaml::Model::Serializable
  attribute :base_jc, :ct_y_align, collection: 0..1
  attribute :max_dist, :ct_on_off, collection: 0..1
  attribute :obj_dist, :ct_on_off, collection: 0..1
  attribute :r_sp_rule, :ct_spacing_rule, collection: 0..1
  attribute :r_sp, :ct_un_signed_integer, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "EqArrPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :baseJc, to: :base_jc
      map_element :maxDist, to: :max_dist
      map_element :objDist, to: :obj_dist
      map_element :rSpRule, to: :r_sp_rule
      map_element :rSp, to: :r_sp
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_eq_arr_pr)
  end
end

CTEqArrPr.register_class_with_id
