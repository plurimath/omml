# frozen_string_literal: true

require_relative "ct_ftn_props"
require_relative "ct_edn_props"
require_relative "ct_sect_type"
require_relative "ct_page_sz"
require_relative "ct_page_mar"
require_relative "ct_paper_source"
require_relative "ct_page_borders"
require_relative "ct_line_number"
require_relative "ct_page_number"
require_relative "ct_columns"
require_relative "ct_on_off"
require_relative "ct_vertical_jc"
require_relative "ct_text_direction"
require_relative "ct_doc_grid"
require_relative "ct_rel"
class EGSectPrContents < Lutaml::Model::Serializable
  attribute :footnote_pr, :ct_ftn_props, collection: 0..1
  attribute :endnote_pr, :ct_edn_props, collection: 0..1
  attribute :type, :ct_sect_type, collection: 0..1
  attribute :pg_sz, :ct_page_sz, collection: 0..1
  attribute :pg_mar, :ct_page_mar, collection: 0..1
  attribute :paper_src, :ct_paper_source, collection: 0..1
  attribute :pg_borders, :ct_page_borders, collection: 0..1
  attribute :ln_num_type, :ct_line_number, collection: 0..1
  attribute :pg_num_type, :ct_page_number, collection: 0..1
  attribute :cols, :ct_columns, collection: 0..1
  attribute :form_prot, :ct_on_off, collection: 0..1
  attribute :v_align, :ct_vertical_jc, collection: 0..1
  attribute :no_endnote, :ct_on_off, collection: 0..1
  attribute :title_pg, :ct_on_off, collection: 0..1
  attribute :text_direction, :ct_text_direction, collection: 0..1
  attribute :bidi, :ct_on_off, collection: 0..1
  attribute :rtl_gutter, :ct_on_off, collection: 0..1
  attribute :doc_grid, :ct_doc_grid, collection: 0..1
  attribute :printer_settings, :ct_rel, collection: 0..1

  xml do
    no_root
    sequence do
      map_element :footnotePr, to: :footnote_pr
      map_element :endnotePr, to: :endnote_pr
      map_element :type, to: :type
      map_element :pgSz, to: :pg_sz
      map_element :pgMar, to: :pg_mar
      map_element :paperSrc, to: :paper_src
      map_element :pgBorders, to: :pg_borders
      map_element :lnNumType, to: :ln_num_type
      map_element :pgNumType, to: :pg_num_type
      map_element :cols, to: :cols
      map_element :formProt, to: :form_prot
      map_element :vAlign, to: :v_align
      map_element :noEndnote, to: :no_endnote
      map_element :titlePg, to: :title_pg
      map_element :textDirection, to: :text_direction
      map_element :bidi, to: :bidi
      map_element :rtlGutter, to: :rtl_gutter
      map_element :docGrid, to: :doc_grid
      map_element :printerSettings, to: :printer_settings
    end
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_sect_pr_contents)
  end
end

EGSectPrContents.register_class_with_id
