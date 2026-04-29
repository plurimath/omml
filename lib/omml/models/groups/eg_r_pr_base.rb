# frozen_string_literal: true

module Omml
  module Models
    class EGRPrBase < Lutaml::Model::Serializable
      attribute :r_style, :ct_string, collection: 0..1
      attribute :r_fonts, :ct_fonts, collection: 0..1
      attribute :b, :ct_wordprocessing_on_off, collection: 0..1
      attribute :b_cs, :ct_wordprocessing_on_off, collection: 0..1
      attribute :i, :ct_wordprocessing_on_off, collection: 0..1
      attribute :i_cs, :ct_wordprocessing_on_off, collection: 0..1
      attribute :caps, :ct_wordprocessing_on_off, collection: 0..1
      attribute :small_caps, :ct_wordprocessing_on_off, collection: 0..1
      attribute :strike, :ct_wordprocessing_on_off, collection: 0..1
      attribute :dstrike, :ct_wordprocessing_on_off, collection: 0..1
      attribute :outline, :ct_wordprocessing_on_off, collection: 0..1
      attribute :shadow, :ct_wordprocessing_on_off, collection: 0..1
      attribute :emboss, :ct_wordprocessing_on_off, collection: 0..1
      attribute :imprint, :ct_wordprocessing_on_off, collection: 0..1
      attribute :no_proof, :ct_wordprocessing_on_off, collection: 0..1
      attribute :snap_to_grid, :ct_wordprocessing_on_off, collection: 0..1
      attribute :vanish, :ct_wordprocessing_on_off, collection: 0..1
      attribute :web_hidden, :ct_wordprocessing_on_off, collection: 0..1
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
      attribute :rtl, :ct_wordprocessing_on_off, collection: 0..1
      attribute :cs, :ct_wordprocessing_on_off, collection: 0..1
      attribute :em, :ct_em, collection: 0..1
      attribute :lang, :ct_language, collection: 0..1
      attribute :east_asian_layout, :ct_east_asian_layout, collection: 0..1
      attribute :spec_vanish, :ct_wordprocessing_on_off, collection: 0..1
      attribute :o_math, :ct_wordprocessing_on_off, collection: 0..1

      xml do
        type_name "EG_RPrBase"
        namespace Omml::WordprocessingNamespace
        map_element :rStyle, to: :r_style
        map_element :rFonts, to: :r_fonts
        map_element :b, to: :b, render_empty: true
        map_element :bCs, to: :b_cs, render_empty: true
        map_element :i, to: :i, render_empty: true
        map_element :iCs, to: :i_cs, render_empty: true
        map_element :caps, to: :caps, render_empty: true
        map_element :smallCaps, to: :small_caps, render_empty: true
        map_element :strike, to: :strike, render_empty: true
        map_element :dstrike, to: :dstrike, render_empty: true
        map_element :outline, to: :outline, render_empty: true
        map_element :shadow, to: :shadow, render_empty: true
        map_element :emboss, to: :emboss, render_empty: true
        map_element :imprint, to: :imprint, render_empty: true
        map_element :noProof, to: :no_proof, render_empty: true
        map_element :snapToGrid, to: :snap_to_grid, render_empty: true
        map_element :vanish, to: :vanish, render_empty: true
        map_element :webHidden, to: :web_hidden, render_empty: true
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
        map_element :rtl, to: :rtl, render_empty: true
        map_element :cs, to: :cs, render_empty: true
        map_element :em, to: :em
        map_element :lang, to: :lang
        map_element :eastAsianLayout, to: :east_asian_layout
        map_element :specVanish, to: :spec_vanish, render_empty: true
        map_element :oMath, to: :o_math, render_empty: true
      end
    end

    Omml::Configuration.register_model(EGRPrBase)
  end
end
