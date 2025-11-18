# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_cnf"
require_relative "ct_tbl_width"
require_relative "ct_decimal_number"
require_relative "ct_h_merge"
require_relative "ct_v_merge"
require_relative "ct_tc_borders"
require_relative "ct_shd"
require_relative "ct_on_off"
require_relative "ct_tc_mar"
require_relative "ct_text_direction"
require_relative "ct_vertical_jc"
class CTTcPrBase < Lutaml::Model::Serializable
  attribute :cnf_style, :ct_cnf, collection: 0..1
  attribute :tc_w, :ct_tbl_width, collection: 0..1
  attribute :grid_span, :ct_decimal_number, collection: 0..1
  attribute :h_merge, :ct_h_merge, collection: 0..1
  attribute :v_merge, :ct_v_merge, collection: 0..1
  attribute :tc_borders, :ct_tc_borders, collection: 0..1
  attribute :shd, :ct_shd, collection: 0..1
  attribute :no_wrap, :ct_on_off, collection: 0..1
  attribute :tc_mar, :ct_tc_mar, collection: 0..1
  attribute :text_direction, :ct_text_direction, collection: 0..1
  attribute :tc_fit_text, :ct_on_off, collection: 0..1
  attribute :v_align, :ct_vertical_jc, collection: 0..1
  attribute :hide_mark, :ct_on_off, collection: 0..1

  xml do
    root "TcPrBase"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :cnfStyle, to: :cnf_style
      map_element :tcW, to: :tc_w
      map_element :gridSpan, to: :grid_span
      map_element :hMerge, to: :h_merge
      map_element :vMerge, to: :v_merge
      map_element :tcBorders, to: :tc_borders
      map_element :shd, to: :shd
      map_element :noWrap, to: :no_wrap
      map_element :tcMar, to: :tc_mar
      map_element :textDirection, to: :text_direction
      map_element :tcFitText, to: :tc_fit_text
      map_element :vAlign, to: :v_align
      map_element :hideMark, to: :hide_mark
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tc_pr_base)
  end
end

CTTcPrBase.register_class_with_id
