# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_cnf"
require_relative "ct_decimal_number"
require_relative "ct_tbl_width"
require_relative "ct_on_off"
require_relative "ct_height"
require_relative "ct_jc"
class CTTrPrBase < Lutaml::Model::Serializable
  choice(min: 1, max: Float::INFINITY) do
    attribute :cnf_style, :ct_cnf, collection: 0..1
    attribute :div_id, :ct_decimal_number, collection: 0..1
    attribute :grid_before, :ct_decimal_number, collection: 0..1
    attribute :grid_after, :ct_decimal_number, collection: 0..1
    attribute :w_before, :ct_tbl_width, collection: 0..1
    attribute :w_after, :ct_tbl_width, collection: 0..1
    attribute :cant_split, :ct_on_off, collection: 0..1
    attribute :tr_height, :ct_height, collection: 0..1
    attribute :tbl_header, :ct_on_off, collection: 0..1
    attribute :tbl_cell_spacing, :ct_tbl_width, collection: 0..1
    attribute :jc, :ct_jc, collection: 0..1
    attribute :hidden, :ct_on_off, collection: 0..1
  end

  xml do
    root "TrPrBase"

    map_element :cnfStyle, to: :cnf_style
    map_element :divId, to: :div_id
    map_element :gridBefore, to: :grid_before
    map_element :gridAfter, to: :grid_after
    map_element :wBefore, to: :w_before
    map_element :wAfter, to: :w_after
    map_element :cantSplit, to: :cant_split
    map_element :trHeight, to: :tr_height
    map_element :tblHeader, to: :tbl_header
    map_element :tblCellSpacing, to: :tbl_cell_spacing
    map_element :jc, to: :jc
    map_element :hidden, to: :hidden
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tr_pr_base)
  end
end

CTTrPrBase.register_class_with_id
