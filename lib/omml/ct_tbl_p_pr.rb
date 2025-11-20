# frozen_string_literal: true

require "lutaml/model"
require_relative "st_twips_measure"
require_relative "st_v_anchor"
require_relative "st_h_anchor"
require_relative "st_x_align"
require_relative "st_signed_twips_measure"
require_relative "st_y_align"
class CTTblPPr < Lutaml::Model::Serializable
  attribute :left_from_text, :st_twips_measure
  attribute :right_from_text, :st_twips_measure
  attribute :top_from_text, :st_twips_measure
  attribute :bottom_from_text, :st_twips_measure
  attribute :vert_anchor, :st_v_anchor
  attribute :horz_anchor, :st_h_anchor
  attribute :tblp_x_spec, :st_x_align
  attribute :tblp_x, :st_signed_twips_measure
  attribute :tblp_y_spec, :st_y_align
  attribute :tblp_y, :st_signed_twips_measure

  xml do
    root "TblPPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :leftFromText, to: :left_from_text
    map_attribute :rightFromText, to: :right_from_text
    map_attribute :topFromText, to: :top_from_text
    map_attribute :bottomFromText, to: :bottom_from_text
    map_attribute :vertAnchor, to: :vert_anchor
    map_attribute :horzAnchor, to: :horz_anchor
    map_attribute :tblpXSpec, to: :tblp_x_spec
    map_attribute :tblpX, to: :tblp_x
    map_attribute :tblpYSpec, to: :tblp_y_spec
    map_attribute :tblpY, to: :tblp_y
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_p_pr)
  end
end

CTTblPPr.register_class_with_id
