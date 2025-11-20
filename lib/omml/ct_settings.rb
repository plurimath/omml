# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_write_protection"
require_relative "ct_view"
require_relative "ct_zoom"
require_relative "ct_on_off"
require_relative "ct_writing_style"
require_relative "ct_proof"
require_relative "ct_rel"
require_relative "ct_short_hex_number"
require_relative "ct_doc_type"
require_relative "ct_mail_merge"
require_relative "ct_track_changes_view"
require_relative "ct_doc_protect"
require_relative "ct_twips_measure"
require_relative "ct_decimal_number"
require_relative "ct_string"
require_relative "ct_character_spacing"
require_relative "ct_kinsoku"
require_relative "ct_save_through_xslt"
require_relative "ct_shape_defaults"
require_relative "ct_ftn_doc_props"
require_relative "ct_edn_doc_props"
require_relative "ct_compat"
require_relative "ct_doc_vars"
require_relative "ct_doc_rsids"
require_relative "ct_math_pr"
require_relative "ct_language"
require_relative "ct_color_scheme_mapping"
require_relative "ct_empty"
require_relative "ct_captions"
require_relative "ct_reading_mode_ink_lock_down"
require_relative "ct_smart_tag_type"
require_relative "ct_schema_library"
class CTSettings < Lutaml::Model::Serializable
  attribute :write_protection, :ct_write_protection, collection: 0..1
  attribute :view, :ct_view, collection: 0..1
  attribute :zoom, :ct_zoom, collection: 0..1
  attribute :remove_personal_information, :ct_on_off, collection: 0..1
  attribute :remove_date_and_time, :ct_on_off, collection: 0..1
  attribute :do_not_display_page_boundaries, :ct_on_off, collection: 0..1
  attribute :display_background_shape, :ct_on_off, collection: 0..1
  attribute :print_post_script_over_text, :ct_on_off, collection: 0..1
  attribute :print_fractional_character_width, :ct_on_off, collection: 0..1
  attribute :print_forms_data, :ct_on_off, collection: 0..1
  attribute :embed_true_type_fonts, :ct_on_off, collection: 0..1
  attribute :embed_system_fonts, :ct_on_off, collection: 0..1
  attribute :save_subset_fonts, :ct_on_off, collection: 0..1
  attribute :save_forms_data, :ct_on_off, collection: 0..1
  attribute :mirror_margins, :ct_on_off, collection: 0..1
  attribute :align_borders_and_edges, :ct_on_off, collection: 0..1
  attribute :borders_do_not_surround_header, :ct_on_off, collection: 0..1
  attribute :borders_do_not_surround_footer, :ct_on_off, collection: 0..1
  attribute :gutter_at_top, :ct_on_off, collection: 0..1
  attribute :hide_spelling_errors, :ct_on_off, collection: 0..1
  attribute :hide_grammatical_errors, :ct_on_off, collection: 0..1
  attribute :active_writing_style, :ct_writing_style, collection: 0..Float::INFINITY
  attribute :proof_state, :ct_proof, collection: 0..1
  attribute :forms_design, :ct_on_off, collection: 0..1
  attribute :attached_template, :ct_rel, collection: 0..1
  attribute :link_styles, :ct_on_off, collection: 0..1
  attribute :style_pane_format_filter, :ct_short_hex_number, collection: 0..1
  attribute :style_pane_sort_method, :ct_short_hex_number, collection: 0..1
  attribute :document_type, :ct_doc_type, collection: 0..1
  attribute :mail_merge, :ct_mail_merge, collection: 0..1
  attribute :revision_view, :ct_track_changes_view, collection: 0..1
  attribute :track_revisions, :ct_on_off, collection: 0..1
  attribute :do_not_track_moves, :ct_on_off, collection: 0..1
  attribute :do_not_track_formatting, :ct_on_off, collection: 0..1
  attribute :document_protection, :ct_doc_protect, collection: 0..1
  attribute :auto_format_override, :ct_on_off, collection: 0..1
  attribute :style_lock_theme, :ct_on_off, collection: 0..1
  attribute :style_lock_qf_set, :ct_on_off, collection: 0..1
  attribute :default_tab_stop, :ct_twips_measure, collection: 0..1
  attribute :auto_hyphenation, :ct_on_off, collection: 0..1
  attribute :consecutive_hyphen_limit, :ct_decimal_number, collection: 0..1
  attribute :hyphenation_zone, :ct_twips_measure, collection: 0..1
  attribute :do_not_hyphenate_caps, :ct_on_off, collection: 0..1
  attribute :show_envelope, :ct_on_off, collection: 0..1
  attribute :summary_length, :ct_decimal_number, collection: 0..1
  attribute :click_and_type_style, :ct_string, collection: 0..1
  attribute :default_table_style, :ct_string, collection: 0..1
  attribute :even_and_odd_headers, :ct_on_off, collection: 0..1
  attribute :book_fold_rev_printing, :ct_on_off, collection: 0..1
  attribute :book_fold_printing, :ct_on_off, collection: 0..1
  attribute :book_fold_printing_sheets, :ct_decimal_number, collection: 0..1
  attribute :drawing_grid_horizontal_spacing, :ct_twips_measure, collection: 0..1
  attribute :drawing_grid_vertical_spacing, :ct_twips_measure, collection: 0..1
  attribute :display_horizontal_drawing_grid_every, :ct_decimal_number, collection: 0..1
  attribute :display_vertical_drawing_grid_every, :ct_decimal_number, collection: 0..1
  attribute :do_not_use_margins_for_drawing_grid_origin, :ct_on_off, collection: 0..1
  attribute :drawing_grid_horizontal_origin, :ct_twips_measure, collection: 0..1
  attribute :drawing_grid_vertical_origin, :ct_twips_measure, collection: 0..1
  attribute :do_not_shade_form_data, :ct_on_off, collection: 0..1
  attribute :no_punctuation_kerning, :ct_on_off, collection: 0..1
  attribute :character_spacing_control, :ct_character_spacing, collection: 0..1
  attribute :print_two_on_one, :ct_on_off, collection: 0..1
  attribute :strict_first_and_last_chars, :ct_on_off, collection: 0..1
  attribute :no_line_breaks_after, :ct_kinsoku, collection: 0..1
  attribute :no_line_breaks_before, :ct_kinsoku, collection: 0..1
  attribute :save_preview_picture, :ct_on_off, collection: 0..1
  attribute :do_not_validate_against_schema, :ct_on_off, collection: 0..1
  attribute :save_invalid_xml, :ct_on_off, collection: 0..1
  attribute :ignore_mixed_content, :ct_on_off, collection: 0..1
  attribute :always_show_placeholder_text, :ct_on_off, collection: 0..1
  attribute :do_not_demarcate_invalid_xml, :ct_on_off, collection: 0..1
  attribute :save_xml_data_only, :ct_on_off, collection: 0..1
  attribute :use_xslt_when_saving, :ct_on_off, collection: 0..1
  attribute :save_through_xslt, :ct_save_through_xslt, collection: 0..1
  attribute :show_xml_tags, :ct_on_off, collection: 0..1
  attribute :always_merge_empty_namespace, :ct_on_off, collection: 0..1
  attribute :update_fields, :ct_on_off, collection: 0..1
  attribute :hdr_shape_defaults, :ct_shape_defaults, collection: 0..1
  attribute :footnote_pr, :ct_ftn_doc_props, collection: 0..1
  attribute :endnote_pr, :ct_edn_doc_props, collection: 0..1
  attribute :compat, :ct_compat, collection: 0..1
  attribute :doc_vars, :ct_doc_vars, collection: 0..1
  attribute :rsids, :ct_doc_rsids, collection: 0..1
  attribute :math_pr, :ct_math_pr, collection: 0..1
  attribute :ui_compat97_to2003, :ct_on_off, collection: 0..1
  attribute :attached_schema, :ct_string, collection: 0..Float::INFINITY
  attribute :theme_font_lang, :ct_language, collection: 0..1
  attribute :clr_scheme_mapping, :ct_color_scheme_mapping, collection: 0..1
  attribute :do_not_include_subdocs_in_stats, :ct_on_off, collection: 0..1
  attribute :do_not_auto_compress_pictures, :ct_on_off, collection: 0..1
  attribute :force_upgrade, :ct_empty, collection: 0..1
  attribute :captions, :ct_captions, collection: 0..1
  attribute :read_mode_ink_lock_down, :ct_reading_mode_ink_lock_down, collection: 0..1
  attribute :smart_tag_type, :ct_smart_tag_type, collection: 0..Float::INFINITY
  attribute :schema_library, :ct_schema_library, collection: 0..1
  attribute :shape_defaults, :ct_shape_defaults, collection: 0..1
  attribute :do_not_embed_smart_tags, :ct_on_off, collection: 0..1
  attribute :decimal_symbol, :ct_string, collection: 0..1
  attribute :list_separator, :ct_string, collection: 0..1

  xml do
    root "Settings", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :writeProtection, to: :write_protection
      map_element :view, to: :view
      map_element :zoom, to: :zoom
      map_element :removePersonalInformation, to: :remove_personal_information
      map_element :removeDateAndTime, to: :remove_date_and_time
      map_element :doNotDisplayPageBoundaries, to: :do_not_display_page_boundaries
      map_element :displayBackgroundShape, to: :display_background_shape
      map_element :printPostScriptOverText, to: :print_post_script_over_text
      map_element :printFractionalCharacterWidth, to: :print_fractional_character_width
      map_element :printFormsData, to: :print_forms_data
      map_element :embedTrueTypeFonts, to: :embed_true_type_fonts
      map_element :embedSystemFonts, to: :embed_system_fonts
      map_element :saveSubsetFonts, to: :save_subset_fonts
      map_element :saveFormsData, to: :save_forms_data
      map_element :mirrorMargins, to: :mirror_margins
      map_element :alignBordersAndEdges, to: :align_borders_and_edges
      map_element :bordersDoNotSurroundHeader, to: :borders_do_not_surround_header
      map_element :bordersDoNotSurroundFooter, to: :borders_do_not_surround_footer
      map_element :gutterAtTop, to: :gutter_at_top
      map_element :hideSpellingErrors, to: :hide_spelling_errors
      map_element :hideGrammaticalErrors, to: :hide_grammatical_errors
      map_element :activeWritingStyle, to: :active_writing_style
      map_element :proofState, to: :proof_state
      map_element :formsDesign, to: :forms_design
      map_element :attachedTemplate, to: :attached_template
      map_element :linkStyles, to: :link_styles
      map_element :stylePaneFormatFilter, to: :style_pane_format_filter
      map_element :stylePaneSortMethod, to: :style_pane_sort_method
      map_element :documentType, to: :document_type
      map_element :mailMerge, to: :mail_merge
      map_element :revisionView, to: :revision_view
      map_element :trackRevisions, to: :track_revisions
      map_element :doNotTrackMoves, to: :do_not_track_moves
      map_element :doNotTrackFormatting, to: :do_not_track_formatting
      map_element :documentProtection, to: :document_protection
      map_element :autoFormatOverride, to: :auto_format_override
      map_element :styleLockTheme, to: :style_lock_theme
      map_element :styleLockQFSet, to: :style_lock_qf_set
      map_element :defaultTabStop, to: :default_tab_stop
      map_element :autoHyphenation, to: :auto_hyphenation
      map_element :consecutiveHyphenLimit, to: :consecutive_hyphen_limit
      map_element :hyphenationZone, to: :hyphenation_zone
      map_element :doNotHyphenateCaps, to: :do_not_hyphenate_caps
      map_element :showEnvelope, to: :show_envelope
      map_element :summaryLength, to: :summary_length
      map_element :clickAndTypeStyle, to: :click_and_type_style
      map_element :defaultTableStyle, to: :default_table_style
      map_element :evenAndOddHeaders, to: :even_and_odd_headers
      map_element :bookFoldRevPrinting, to: :book_fold_rev_printing
      map_element :bookFoldPrinting, to: :book_fold_printing
      map_element :bookFoldPrintingSheets, to: :book_fold_printing_sheets
      map_element :drawingGridHorizontalSpacing, to: :drawing_grid_horizontal_spacing
      map_element :drawingGridVerticalSpacing, to: :drawing_grid_vertical_spacing
      map_element :displayHorizontalDrawingGridEvery, to: :display_horizontal_drawing_grid_every
      map_element :displayVerticalDrawingGridEvery, to: :display_vertical_drawing_grid_every
      map_element :doNotUseMarginsForDrawingGridOrigin, to: :do_not_use_margins_for_drawing_grid_origin
      map_element :drawingGridHorizontalOrigin, to: :drawing_grid_horizontal_origin
      map_element :drawingGridVerticalOrigin, to: :drawing_grid_vertical_origin
      map_element :doNotShadeFormData, to: :do_not_shade_form_data
      map_element :noPunctuationKerning, to: :no_punctuation_kerning
      map_element :characterSpacingControl, to: :character_spacing_control
      map_element :printTwoOnOne, to: :print_two_on_one
      map_element :strictFirstAndLastChars, to: :strict_first_and_last_chars
      map_element :noLineBreaksAfter, to: :no_line_breaks_after
      map_element :noLineBreaksBefore, to: :no_line_breaks_before
      map_element :savePreviewPicture, to: :save_preview_picture
      map_element :doNotValidateAgainstSchema, to: :do_not_validate_against_schema
      map_element :saveInvalidXml, to: :save_invalid_xml
      map_element :ignoreMixedContent, to: :ignore_mixed_content
      map_element :alwaysShowPlaceholderText, to: :always_show_placeholder_text
      map_element :doNotDemarcateInvalidXml, to: :do_not_demarcate_invalid_xml
      map_element :saveXmlDataOnly, to: :save_xml_data_only
      map_element :useXSLTWhenSaving, to: :use_xslt_when_saving
      map_element :saveThroughXslt, to: :save_through_xslt
      map_element :showXMLTags, to: :show_xml_tags
      map_element :alwaysMergeEmptyNamespace, to: :always_merge_empty_namespace
      map_element :updateFields, to: :update_fields
      map_element :hdrShapeDefaults, to: :hdr_shape_defaults
      map_element :footnotePr, to: :footnote_pr
      map_element :endnotePr, to: :endnote_pr
      map_element :compat, to: :compat
      map_element :docVars, to: :doc_vars
      map_element :rsids, to: :rsids
      map_element :mathPr, to: :math_pr
      map_element :uiCompat97To2003, to: :ui_compat97_to2003
      map_element :attachedSchema, to: :attached_schema
      map_element :themeFontLang, to: :theme_font_lang
      map_element :clrSchemeMapping, to: :clr_scheme_mapping
      map_element :doNotIncludeSubdocsInStats, to: :do_not_include_subdocs_in_stats
      map_element :doNotAutoCompressPictures, to: :do_not_auto_compress_pictures
      map_element :forceUpgrade, to: :force_upgrade
      map_element :captions, to: :captions
      map_element :readModeInkLockDown, to: :read_mode_ink_lock_down
      map_element :smartTagType, to: :smart_tag_type
      map_element :schemaLibrary, to: :schema_library
      map_element :shapeDefaults, to: :shape_defaults
      map_element :doNotEmbedSmartTags, to: :do_not_embed_smart_tags
      map_element :decimalSymbol, to: :decimal_symbol
      map_element :listSeparator, to: :list_separator
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_settings)
  end
end

CTSettings.register_class_with_id
