# frozen_string_literal: true

module Omml
  module Models
    # WordprocessingML run inner content elements referenced from CT_R via
    # <xsd:group ref="w:EG_RunInnerContent" /> in shared-math.xsd.
    #
    # Every element here belongs to the WordprocessingML namespace regardless
    # of its containing parent. CT_R's choice has maxOccurs="unbounded", so
    # every attribute here is a collection — multiple <w:br/> can appear
    # interleaved with math text and other wordprocessing elements.
    class EGWordRunInnerContent < Base
      choice(min: 1, max: 1) do
        attribute :br, :ct_br, collection: true
        attribute :del_text, :ct_wordprocessing_text, collection: true
        attribute :instr_text, :ct_wordprocessing_text, collection: true
        attribute :del_instr_text, :ct_wordprocessing_text, collection: true
        attribute :no_break_hyphen, :ct_wordprocessing_empty, collection: true
        attribute :soft_hyphen, :ct_wordprocessing_empty, collection: true
        attribute :day_short, :ct_wordprocessing_empty, collection: true
        attribute :month_short, :ct_wordprocessing_empty, collection: true
        attribute :year_short, :ct_wordprocessing_empty, collection: true
        attribute :day_long, :ct_wordprocessing_empty, collection: true
        attribute :month_long, :ct_wordprocessing_empty, collection: true
        attribute :year_long, :ct_wordprocessing_empty, collection: true
        attribute :annotation_ref, :ct_wordprocessing_empty, collection: true
        attribute :footnote_ref, :ct_wordprocessing_empty, collection: true
        attribute :endnote_ref, :ct_wordprocessing_empty, collection: true
        attribute :separator, :ct_wordprocessing_empty, collection: true
        attribute :continuation_separator, :ct_wordprocessing_empty,
                  collection: true
        attribute :sym, :ct_sym, collection: true
        attribute :pg_num, :ct_wordprocessing_empty, collection: true
        attribute :cr, :ct_wordprocessing_empty, collection: true
        attribute :tab, :ct_wordprocessing_empty, collection: true
        attribute :object, :ct_object, collection: true
        attribute :pict, :ct_picture, collection: true
        attribute :fld_char, :ct_fld_char, collection: true
        attribute :ruby, :ct_ruby, collection: true
        attribute :footnote_reference, :ct_ftn_edn_ref, collection: true
        attribute :endnote_reference, :ct_ftn_edn_ref, collection: true
        attribute :comment_reference, :ct_markup, collection: true
        attribute :drawing, :ct_drawing, collection: true
        attribute :ptab, :ct_p_tab, collection: true
        attribute :last_rendered_page_break, :ct_wordprocessing_empty,
                  collection: true
      end

      xml do
        type_name "EG_WordRunInnerContent"
        namespace Omml::WordprocessingNamespace

        map_element :br, to: :br, render_empty: true
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
  end
end
