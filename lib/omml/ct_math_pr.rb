# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_break_bin"
require_relative "ct_break_bin_sub"
require_relative "ct_on_off"
require_relative "ct_twips_measure"
require_relative "ct_o_math_jc"
require_relative "ct_lim_loc"
class CTMathPr < Lutaml::Model::Serializable
  attribute :math_font, :ct_string, collection: 0..1
  attribute :brk_bin, :ct_break_bin, collection: 0..1
  attribute :brk_bin_sub, :ct_break_bin_sub, collection: 0..1
  attribute :small_frac, :ct_on_off, collection: 0..1
  attribute :disp_def, :ct_on_off, collection: 0..1
  attribute :l_margin, :ct_twips_measure, collection: 0..1
  attribute :r_margin, :ct_twips_measure, collection: 0..1
  attribute :def_jc, :ct_o_math_jc, collection: 0..1
  attribute :pre_sp, :ct_twips_measure, collection: 0..1
  attribute :post_sp, :ct_twips_measure, collection: 0..1
  attribute :inter_sp, :ct_twips_measure, collection: 0..1
  attribute :intra_sp, :ct_twips_measure, collection: 0..1
  choice(min: 0, max: 1) do
    attribute :wrap_indent, :ct_twips_measure
    attribute :wrap_right, :ct_on_off
  end
  attribute :int_lim, :ct_lim_loc, collection: 0..1
  attribute :nary_lim, :ct_lim_loc, collection: 0..1

  xml do
    root "MathPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :mathFont, to: :math_font
      map_element :brkBin, to: :brk_bin
      map_element :brkBinSub, to: :brk_bin_sub
      map_element :smallFrac, to: :small_frac
      map_element :dispDef, to: :disp_def
      map_element :lMargin, to: :l_margin
      map_element :rMargin, to: :r_margin
      map_element :defJc, to: :def_jc
      map_element :preSp, to: :pre_sp
      map_element :postSp, to: :post_sp
      map_element :interSp, to: :inter_sp
      map_element :intraSp, to: :intra_sp
      map_element :wrapIndent, to: :wrap_indent
      map_element :wrapRight, to: :wrap_right
      map_element :intLim, to: :int_lim
      map_element :naryLim, to: :nary_lim
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_math_pr)
  end
end

CTMathPr.register_class_with_id
