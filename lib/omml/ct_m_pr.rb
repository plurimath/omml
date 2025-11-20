# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_y_align"
require_relative "ct_on_off"
require_relative "ct_spacing_rule"
require_relative "ct_un_signed_integer"
require_relative "ct_mcs"
require_relative "ct_ctrl_pr"
class CTMPr < Lutaml::Model::Serializable
  attribute :base_jc, :ct_y_align, collection: 0..1
  attribute :plc_hide, :ct_on_off, collection: 0..1
  attribute :r_sp_rule, :ct_spacing_rule, collection: 0..1
  attribute :c_gp_rule, :ct_spacing_rule, collection: 0..1
  attribute :r_sp, :ct_un_signed_integer, collection: 0..1
  attribute :c_sp, :ct_un_signed_integer, collection: 0..1
  attribute :c_gp, :ct_un_signed_integer, collection: 0..1
  attribute :mcs, :ct_mcs, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "MPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :baseJc, to: :base_jc
      map_element :plcHide, to: :plc_hide
      map_element :rSpRule, to: :r_sp_rule
      map_element :cGpRule, to: :c_gp_rule
      map_element :rSp, to: :r_sp
      map_element :cSp, to: :c_sp
      map_element :cGp, to: :c_gp
      map_element :mcs, to: :mcs
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_m_pr)
  end
end

CTMPr.register_class_with_id
