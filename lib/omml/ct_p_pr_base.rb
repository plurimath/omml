# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_on_off"
require_relative "ct_frame_pr"
require_relative "ct_num_pr"
require_relative "ct_p_bdr"
require_relative "ct_shd"
require_relative "ct_tabs"
require_relative "ct_spacing"
require_relative "ct_ind"
require_relative "ct_jc"
require_relative "ct_text_direction"
require_relative "ct_text_alignment"
require_relative "ct_textbox_tight_wrap"
require_relative "ct_decimal_number"
require_relative "ct_cnf"
class CTPPrBase < Lutaml::Model::Serializable
  attribute :p_style, :ct_string, collection: 0..1
  attribute :keep_next, :ct_on_off, collection: 0..1
  attribute :keep_lines, :ct_on_off, collection: 0..1
  attribute :page_break_before, :ct_on_off, collection: 0..1
  attribute :frame_pr, :ct_frame_pr, collection: 0..1
  attribute :widow_control, :ct_on_off, collection: 0..1
  attribute :num_pr, :ct_num_pr, collection: 0..1
  attribute :suppress_line_numbers, :ct_on_off, collection: 0..1
  attribute :p_bdr, :ct_p_bdr, collection: 0..1
  attribute :shd, :ct_shd, collection: 0..1
  attribute :tabs, :ct_tabs, collection: 0..1
  attribute :suppress_auto_hyphens, :ct_on_off, collection: 0..1
  attribute :kinsoku, :ct_on_off, collection: 0..1
  attribute :word_wrap, :ct_on_off, collection: 0..1
  attribute :overflow_punct, :ct_on_off, collection: 0..1
  attribute :top_line_punct, :ct_on_off, collection: 0..1
  attribute :auto_space_de, :ct_on_off, collection: 0..1
  attribute :auto_space_dn, :ct_on_off, collection: 0..1
  attribute :bidi, :ct_on_off, collection: 0..1
  attribute :adjust_right_ind, :ct_on_off, collection: 0..1
  attribute :snap_to_grid, :ct_on_off, collection: 0..1
  attribute :spacing, :ct_spacing, collection: 0..1
  attribute :ind, :ct_ind, collection: 0..1
  attribute :contextual_spacing, :ct_on_off, collection: 0..1
  attribute :mirror_indents, :ct_on_off, collection: 0..1
  attribute :suppress_overlap, :ct_on_off, collection: 0..1
  attribute :jc, :ct_jc, collection: 0..1
  attribute :text_direction, :ct_text_direction, collection: 0..1
  attribute :text_alignment, :ct_text_alignment, collection: 0..1
  attribute :textbox_tight_wrap, :ct_textbox_tight_wrap, collection: 0..1
  attribute :outline_lvl, :ct_decimal_number, collection: 0..1
  attribute :div_id, :ct_decimal_number, collection: 0..1
  attribute :cnf_style, :ct_cnf, collection: 0..1

  xml do
    root "PPrBase"

    sequence do
      map_element :pStyle, to: :p_style
      map_element :keepNext, to: :keep_next
      map_element :keepLines, to: :keep_lines
      map_element :pageBreakBefore, to: :page_break_before
      map_element :framePr, to: :frame_pr
      map_element :widowControl, to: :widow_control
      map_element :numPr, to: :num_pr
      map_element :suppressLineNumbers, to: :suppress_line_numbers
      map_element :pBdr, to: :p_bdr
      map_element :shd, to: :shd
      map_element :tabs, to: :tabs
      map_element :suppressAutoHyphens, to: :suppress_auto_hyphens
      map_element :kinsoku, to: :kinsoku
      map_element :wordWrap, to: :word_wrap
      map_element :overflowPunct, to: :overflow_punct
      map_element :topLinePunct, to: :top_line_punct
      map_element :autoSpaceDE, to: :auto_space_de
      map_element :autoSpaceDN, to: :auto_space_dn
      map_element :bidi, to: :bidi
      map_element :adjustRightInd, to: :adjust_right_ind
      map_element :snapToGrid, to: :snap_to_grid
      map_element :spacing, to: :spacing
      map_element :ind, to: :ind
      map_element :contextualSpacing, to: :contextual_spacing
      map_element :mirrorIndents, to: :mirror_indents
      map_element :suppressOverlap, to: :suppress_overlap
      map_element :jc, to: :jc
      map_element :textDirection, to: :text_direction
      map_element :textAlignment, to: :text_alignment
      map_element :textboxTightWrap, to: :textbox_tight_wrap
      map_element :outlineLvl, to: :outline_lvl
      map_element :divId, to: :div_id
      map_element :cnfStyle, to: :cnf_style
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_p_pr_base)
  end
end

CTPPrBase.register_class_with_id
