# frozen_string_literal: true

require_relative "ct_string"
require_relative "ct_fonts"
require_relative "ct_on_off"
require_relative "ct_color"
require_relative "ct_signed_twips_measure"
require_relative "ct_text_scale"
require_relative "ct_hps_measure"
require_relative "ct_signed_hps_measure"
require_relative "ct_highlight"
require_relative "ct_underline"
require_relative "ct_text_effect"
require_relative "ct_border"
require_relative "ct_shd"
require_relative "ct_fit_text"
require_relative "ct_vertical_align_run"
require_relative "ct_em"
require_relative "ct_language"
require_relative "ct_east_asian_layout"
class EGRPrBase < Lutaml::Model::Serializable
  attribute :r_style, :ct_string, collection: 0..1
  attribute :r_fonts, :ct_fonts, collection: 0..1
  attribute :b, :ct_on_off, collection: 0..1
  attribute :b_cs, :ct_on_off, collection: 0..1
  attribute :i, :ct_on_off, collection: 0..1
  attribute :i_cs, :ct_on_off, collection: 0..1
  attribute :caps, :ct_on_off, collection: 0..1
  attribute :small_caps, :ct_on_off, collection: 0..1
  attribute :strike, :ct_on_off, collection: 0..1
  attribute :dstrike, :ct_on_off, collection: 0..1
  attribute :outline, :ct_on_off, collection: 0..1
  attribute :shadow, :ct_on_off, collection: 0..1
  attribute :emboss, :ct_on_off, collection: 0..1
  attribute :imprint, :ct_on_off, collection: 0..1
  attribute :no_proof, :ct_on_off, collection: 0..1
  attribute :snap_to_grid, :ct_on_off, collection: 0..1
  attribute :vanish, :ct_on_off, collection: 0..1
  attribute :web_hidden, :ct_on_off, collection: 0..1
  attribute :color, :ct_color, collection: 0..1
  attribute :spacing, :ct_signed_twips_measure, collection: 0..1
  attribute :w, :ct_text_scale, collection: 0..1
  attribute :kern, :ct_hps_measure, collection: 0..1
  attribute :position, :ct_signed_hps_measure, collection: 0..1
  attribute :sz, :ct_hps_measure, collection: 0..1
  attribute :sz_cs, :ct_hps_measure, collection: 0..1
  attribute :highlight, :ct_highlight, collection: 0..1
  attribute :u, :ct_underline, collection: 0..1
  attribute :effect, :ct_text_effect, collection: 0..1
  attribute :bdr, :ct_border, collection: 0..1
  attribute :shd, :ct_shd, collection: 0..1
  attribute :fit_text, :ct_fit_text, collection: 0..1
  attribute :vert_align, :ct_vertical_align_run, collection: 0..1
  attribute :rtl, :ct_on_off, collection: 0..1
  attribute :cs, :ct_on_off, collection: 0..1
  attribute :em, :ct_em, collection: 0..1
  attribute :lang, :ct_language, collection: 0..1
  attribute :east_asian_layout, :ct_east_asian_layout, collection: 0..1
  attribute :spec_vanish, :ct_on_off, collection: 0..1
  attribute :o_math, :ct_on_off, collection: 0..1

  xml do
    no_root
    sequence do
      map_element :rStyle, to: :r_style
      map_element :rFonts, to: :r_fonts
      map_element :b, to: :b
      map_element :bCs, to: :b_cs
      map_element :i, to: :i
      map_element :iCs, to: :i_cs
      map_element :caps, to: :caps
      map_element :smallCaps, to: :small_caps
      map_element :strike, to: :strike
      map_element :dstrike, to: :dstrike
      map_element :outline, to: :outline
      map_element :shadow, to: :shadow
      map_element :emboss, to: :emboss
      map_element :imprint, to: :imprint
      map_element :noProof, to: :no_proof
      map_element :snapToGrid, to: :snap_to_grid
      map_element :vanish, to: :vanish
      map_element :webHidden, to: :web_hidden
      map_element :color, to: :color
      map_element :spacing, to: :spacing
      map_element :w, to: :w
      map_element :kern, to: :kern
      map_element :position, to: :position
      map_element :sz, to: :sz
      map_element :szCs, to: :sz_cs
      map_element :highlight, to: :highlight
      map_element :u, to: :u
      map_element :effect, to: :effect
      map_element :bdr, to: :bdr
      map_element :shd, to: :shd
      map_element :fitText, to: :fit_text
      map_element :vertAlign, to: :vert_align
      map_element :rtl, to: :rtl
      map_element :cs, to: :cs
      map_element :em, to: :em
      map_element :lang, to: :lang
      map_element :eastAsianLayout, to: :east_asian_layout
      map_element :specVanish, to: :spec_vanish
      map_element :oMath, to: :o_math
    end
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_r_pr_base)
  end
end

EGRPrBase.register_class_with_id
