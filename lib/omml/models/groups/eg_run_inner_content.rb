# frozen_string_literal: true

require_relative "../ct_br"
require_relative "../ct_text"
require_relative "../ct_empty"
require_relative "../ct_sym"
require_relative "../ct_object"
require_relative "../ct_picture"
require_relative "../ct_fld_char"
require_relative "../ct_ruby"
require_relative "../ct_ftn_edn_ref"
require_relative "../ct_markup"
require_relative "../ct_drawing"
require_relative "../ct_p_tab"
module Omml
  module Models
    class EGRunInnerContent < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        attribute :br, :string
        attribute :t, :ct_text
        attribute :del_text, :ct_text
        attribute :instr_text, :ct_text
        attribute :del_instr_text, :ct_text
        attribute :no_break_hyphen, :ct_empty
        attribute :soft_hyphen, :ct_empty, collection: 0..1
        attribute :day_short, :ct_empty, collection: 0..1
        attribute :month_short, :ct_empty, collection: 0..1
        attribute :year_short, :ct_empty, collection: 0..1
        attribute :day_long, :ct_empty, collection: 0..1
        attribute :month_long, :ct_empty, collection: 0..1
        attribute :year_long, :ct_empty, collection: 0..1
        attribute :annotation_ref, :ct_empty, collection: 0..1
        attribute :footnote_ref, :ct_empty, collection: 0..1
        attribute :endnote_ref, :ct_empty, collection: 0..1
        attribute :separator, :ct_empty, collection: 0..1
        attribute :continuation_separator, :ct_empty, collection: 0..1
        attribute :sym, :ct_sym, collection: 0..1
        attribute :pg_num, :ct_empty, collection: 0..1
        attribute :cr, :ct_empty, collection: 0..1
        attribute :tab, :ct_empty, collection: 0..1
        attribute :object, :ct_object
        attribute :pict, :ct_picture
        attribute :fld_char, :ct_fld_char
        attribute :ruby, :ct_ruby
        attribute :footnote_reference, :ct_ftn_edn_ref
        attribute :endnote_reference, :ct_ftn_edn_ref
        attribute :comment_reference, :ct_markup
        attribute :drawing, :ct_drawing
        attribute :ptab, :ct_p_tab, collection: 0..1
        attribute :last_rendered_page_break, :ct_empty, collection: 0..1
      end

      xml do
        type_name "EG_RunInnerContent"
        map_element :br, to: :br, render_empty: true, namespace: nil
        map_element :t, to: :t, render_empty: true
        map_element :delText, to: :del_text, render_empty: true
        map_element :instrText, to: :instr_text, render_empty: true
        map_element :delInstrText, to: :del_instr_text, render_empty: true
        map_element :noBreakHyphen, to: :no_break_hyphen, render_empty: true
        map_element :softHyphen, to: :soft_hyphen
        map_element :dayShort, to: :day_short
        map_element :monthShort, to: :month_short
        map_element :yearShort, to: :year_short
        map_element :dayLong, to: :day_long
        map_element :monthLong, to: :month_long
        map_element :yearLong, to: :year_long
        map_element :annotationRef, to: :annotation_ref
        map_element :footnoteRef, to: :footnote_ref
        map_element :endnoteRef, to: :endnote_ref
        map_element :separator, to: :separator
        map_element :continuationSeparator, to: :continuation_separator
        map_element :sym, to: :sym
        map_element :pgNum, to: :pg_num
        map_element :cr, to: :cr
        map_element :tab, to: :tab
        map_element :object, to: :object, render_empty: true
        map_element :pict, to: :pict, render_empty: true
        map_element :fldChar, to: :fld_char, render_empty: true
        map_element :ruby, to: :ruby, render_empty: true
        map_element :footnoteReference, to: :footnote_reference,
                                        render_empty: true
        map_element :endnoteReference, to: :endnote_reference,
                                       render_empty: true
        map_element :commentReference, to: :comment_reference,
                                       render_empty: true
        map_element :drawing, to: :drawing, render_empty: true
        map_element :ptab, to: :ptab
        map_element :lastRenderedPageBreak, to: :last_rendered_page_break
      end
    end

    Omml::Configuration.register_model(EGRunInnerContent)
  end
end
