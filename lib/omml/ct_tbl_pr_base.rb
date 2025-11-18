# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_tbl_p_pr"
require_relative "ct_tbl_overlap"
require_relative "ct_on_off"
require_relative "ct_decimal_number"
require_relative "ct_tbl_width"
require_relative "ct_jc"
require_relative "ct_tbl_borders"
require_relative "ct_shd"
require_relative "ct_tbl_layout_type"
require_relative "ct_tbl_cell_mar"
require_relative "ct_short_hex_number"
class CTTblPrBase < Lutaml::Model::Serializable
  attribute :tbl_style, :ct_string, collection: 0..1
  attribute :tblp_pr, :ct_tbl_p_pr, collection: 0..1
  attribute :tbl_overlap, :ct_tbl_overlap, collection: 0..1
  attribute :bidi_visual, :ct_on_off, collection: 0..1
  attribute :tbl_style_row_band_size, :ct_decimal_number, collection: 0..1
  attribute :tbl_style_col_band_size, :ct_decimal_number, collection: 0..1
  attribute :tbl_w, :ct_tbl_width, collection: 0..1
  attribute :jc, :ct_jc, collection: 0..1
  attribute :tbl_cell_spacing, :ct_tbl_width, collection: 0..1
  attribute :tbl_ind, :ct_tbl_width, collection: 0..1
  attribute :tbl_borders, :ct_tbl_borders, collection: 0..1
  attribute :shd, :ct_shd, collection: 0..1
  attribute :tbl_layout, :ct_tbl_layout_type, collection: 0..1
  attribute :tbl_cell_mar, :ct_tbl_cell_mar, collection: 0..1
  attribute :tbl_look, :ct_short_hex_number, collection: 0..1

  xml do
    root "TblPrBase"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :tblStyle, to: :tbl_style
      map_element :tblpPr, to: :tblp_pr
      map_element :tblOverlap, to: :tbl_overlap
      map_element :bidiVisual, to: :bidi_visual
      map_element :tblStyleRowBandSize, to: :tbl_style_row_band_size
      map_element :tblStyleColBandSize, to: :tbl_style_col_band_size
      map_element :tblW, to: :tbl_w
      map_element :jc, to: :jc
      map_element :tblCellSpacing, to: :tbl_cell_spacing
      map_element :tblInd, to: :tbl_ind
      map_element :tblBorders, to: :tbl_borders
      map_element :shd, to: :shd
      map_element :tblLayout, to: :tbl_layout
      map_element :tblCellMar, to: :tbl_cell_mar
      map_element :tblLook, to: :tbl_look
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_pr_base)
  end
end

CTTblPrBase.register_class_with_id
