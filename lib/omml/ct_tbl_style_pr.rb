# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_p_pr"
require_relative "ct_r_pr"
require_relative "ct_tbl_pr_base"
require_relative "ct_tr_pr"
require_relative "ct_tc_pr"
require_relative "st_tbl_style_override_type"
class CTTblStylePr < Lutaml::Model::Serializable
  attribute :p_pr, :ct_p_pr, collection: 0..1
  attribute :r_pr, :ct_r_pr, collection: 0..1
  attribute :tbl_pr, :ct_tbl_pr_base, collection: 0..1
  attribute :tr_pr, :ct_tr_pr, collection: 0..1
  attribute :tc_pr, :ct_tc_pr, collection: 0..1
  attribute :type, :st_tbl_style_override_type

  xml do
    root "TblStylePr"

    sequence do
      map_element :pPr, to: :p_pr
      map_element :rPr, to: :r_pr
      map_element :tblPr, to: :tbl_pr
      map_element :trPr, to: :tr_pr
      map_element :tcPr, to: :tc_pr
    end
    map_attribute :type, to: :type
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_style_pr)
  end
end

CTTblStylePr.register_class_with_id
