# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_on_off"
class CTCompat < Lutaml::Model::Serializable
  attribute :use_single_borderfor_contiguous_cells, :ct_on_off, collection: 0..1
  attribute :wp_justification, :ct_on_off, collection: 0..1
  attribute :no_tab_hang_ind, :ct_on_off, collection: 0..1
  attribute :no_leading, :ct_on_off, collection: 0..1
  attribute :space_for_ul, :ct_on_off, collection: 0..1
  attribute :no_column_balance, :ct_on_off, collection: 0..1
  attribute :balance_single_byte_double_byte_width, :ct_on_off, collection: 0..1
  attribute :no_extra_line_spacing, :ct_on_off, collection: 0..1
  attribute :do_not_leave_backslash_alone, :ct_on_off, collection: 0..1
  attribute :ul_trail_space, :ct_on_off, collection: 0..1
  attribute :do_not_expand_shift_return, :ct_on_off, collection: 0..1
  attribute :spacing_in_whole_points, :ct_on_off, collection: 0..1
  attribute :line_wrap_like_word6, :ct_on_off, collection: 0..1
  attribute :print_body_text_before_header, :ct_on_off, collection: 0..1
  attribute :print_col_black, :ct_on_off, collection: 0..1
  attribute :wp_space_width, :ct_on_off, collection: 0..1
  attribute :show_breaks_in_frames, :ct_on_off, collection: 0..1
  attribute :sub_font_by_size, :ct_on_off, collection: 0..1
  attribute :suppress_bottom_spacing, :ct_on_off, collection: 0..1
  attribute :suppress_top_spacing, :ct_on_off, collection: 0..1
  attribute :suppress_spacing_at_top_of_page, :ct_on_off, collection: 0..1
  attribute :suppress_top_spacing_wp, :ct_on_off, collection: 0..1
  attribute :suppress_sp_bf_after_pg_brk, :ct_on_off, collection: 0..1
  attribute :swap_borders_facing_pages, :ct_on_off, collection: 0..1
  attribute :conv_mail_merge_esc, :ct_on_off, collection: 0..1
  attribute :truncate_font_heights_like_wp6, :ct_on_off, collection: 0..1
  attribute :mw_small_caps, :ct_on_off, collection: 0..1
  attribute :use_printer_metrics, :ct_on_off, collection: 0..1
  attribute :do_not_suppress_paragraph_borders, :ct_on_off, collection: 0..1
  attribute :wrap_trail_spaces, :ct_on_off, collection: 0..1
  attribute :footnote_layout_like_ww8, :ct_on_off, collection: 0..1
  attribute :shape_layout_like_ww8, :ct_on_off, collection: 0..1
  attribute :align_tables_row_by_row, :ct_on_off, collection: 0..1
  attribute :forget_last_tab_alignment, :ct_on_off, collection: 0..1
  attribute :adjust_line_height_in_table, :ct_on_off, collection: 0..1
  attribute :auto_space_like_word95, :ct_on_off, collection: 0..1
  attribute :no_space_raise_lower, :ct_on_off, collection: 0..1
  attribute :do_not_use_html_paragraph_auto_spacing, :ct_on_off, collection: 0..1
  attribute :layout_raw_table_width, :ct_on_off, collection: 0..1
  attribute :layout_table_rows_apart, :ct_on_off, collection: 0..1
  attribute :use_word97_line_break_rules, :ct_on_off, collection: 0..1
  attribute :do_not_break_wrapped_tables, :ct_on_off, collection: 0..1
  attribute :do_not_snap_to_grid_in_cell, :ct_on_off, collection: 0..1
  attribute :select_fld_with_first_or_last_char, :ct_on_off, collection: 0..1
  attribute :apply_breaking_rules, :ct_on_off, collection: 0..1
  attribute :do_not_wrap_text_with_punct, :ct_on_off, collection: 0..1
  attribute :do_not_use_east_asian_break_rules, :ct_on_off, collection: 0..1
  attribute :use_word2002_table_style_rules, :ct_on_off, collection: 0..1
  attribute :grow_autofit, :ct_on_off, collection: 0..1
  attribute :use_fe_layout, :ct_on_off, collection: 0..1
  attribute :use_normal_style_for_list, :ct_on_off, collection: 0..1
  attribute :do_not_use_indent_as_numbering_tab_stop, :ct_on_off, collection: 0..1
  attribute :use_alt_kinsoku_line_break_rules, :ct_on_off, collection: 0..1
  attribute :allow_space_of_same_style_in_table, :ct_on_off, collection: 0..1
  attribute :do_not_suppress_indentation, :ct_on_off, collection: 0..1
  attribute :do_not_autofit_constrained_tables, :ct_on_off, collection: 0..1
  attribute :autofit_to_first_fixed_width_cell, :ct_on_off, collection: 0..1
  attribute :underline_tab_in_num_list, :ct_on_off, collection: 0..1
  attribute :display_hangul_fixed_width, :ct_on_off, collection: 0..1
  attribute :split_pg_break_and_para_mark, :ct_on_off, collection: 0..1
  attribute :do_not_vert_align_cell_with_sp, :ct_on_off, collection: 0..1
  attribute :do_not_break_constrained_forced_table, :ct_on_off, collection: 0..1
  attribute :do_not_vert_align_in_txbx, :ct_on_off, collection: 0..1
  attribute :use_ansi_kerning_pairs, :ct_on_off, collection: 0..1
  attribute :cached_col_balance, :ct_on_off, collection: 0..1

  xml do
    root "Compat"

    sequence do
      map_element :useSingleBorderforContiguousCells, to: :use_single_borderfor_contiguous_cells
      map_element :wpJustification, to: :wp_justification
      map_element :noTabHangInd, to: :no_tab_hang_ind
      map_element :noLeading, to: :no_leading
      map_element :spaceForUL, to: :space_for_ul
      map_element :noColumnBalance, to: :no_column_balance
      map_element :balanceSingleByteDoubleByteWidth, to: :balance_single_byte_double_byte_width
      map_element :noExtraLineSpacing, to: :no_extra_line_spacing
      map_element :doNotLeaveBackslashAlone, to: :do_not_leave_backslash_alone
      map_element :ulTrailSpace, to: :ul_trail_space
      map_element :doNotExpandShiftReturn, to: :do_not_expand_shift_return
      map_element :spacingInWholePoints, to: :spacing_in_whole_points
      map_element :lineWrapLikeWord6, to: :line_wrap_like_word6
      map_element :printBodyTextBeforeHeader, to: :print_body_text_before_header
      map_element :printColBlack, to: :print_col_black
      map_element :wpSpaceWidth, to: :wp_space_width
      map_element :showBreaksInFrames, to: :show_breaks_in_frames
      map_element :subFontBySize, to: :sub_font_by_size
      map_element :suppressBottomSpacing, to: :suppress_bottom_spacing
      map_element :suppressTopSpacing, to: :suppress_top_spacing
      map_element :suppressSpacingAtTopOfPage, to: :suppress_spacing_at_top_of_page
      map_element :suppressTopSpacingWP, to: :suppress_top_spacing_wp
      map_element :suppressSpBfAfterPgBrk, to: :suppress_sp_bf_after_pg_brk
      map_element :swapBordersFacingPages, to: :swap_borders_facing_pages
      map_element :convMailMergeEsc, to: :conv_mail_merge_esc
      map_element :truncateFontHeightsLikeWP6, to: :truncate_font_heights_like_wp6
      map_element :mwSmallCaps, to: :mw_small_caps
      map_element :usePrinterMetrics, to: :use_printer_metrics
      map_element :doNotSuppressParagraphBorders, to: :do_not_suppress_paragraph_borders
      map_element :wrapTrailSpaces, to: :wrap_trail_spaces
      map_element :footnoteLayoutLikeWW8, to: :footnote_layout_like_ww8
      map_element :shapeLayoutLikeWW8, to: :shape_layout_like_ww8
      map_element :alignTablesRowByRow, to: :align_tables_row_by_row
      map_element :forgetLastTabAlignment, to: :forget_last_tab_alignment
      map_element :adjustLineHeightInTable, to: :adjust_line_height_in_table
      map_element :autoSpaceLikeWord95, to: :auto_space_like_word95
      map_element :noSpaceRaiseLower, to: :no_space_raise_lower
      map_element :doNotUseHTMLParagraphAutoSpacing, to: :do_not_use_html_paragraph_auto_spacing
      map_element :layoutRawTableWidth, to: :layout_raw_table_width
      map_element :layoutTableRowsApart, to: :layout_table_rows_apart
      map_element :useWord97LineBreakRules, to: :use_word97_line_break_rules
      map_element :doNotBreakWrappedTables, to: :do_not_break_wrapped_tables
      map_element :doNotSnapToGridInCell, to: :do_not_snap_to_grid_in_cell
      map_element :selectFldWithFirstOrLastChar, to: :select_fld_with_first_or_last_char
      map_element :applyBreakingRules, to: :apply_breaking_rules
      map_element :doNotWrapTextWithPunct, to: :do_not_wrap_text_with_punct
      map_element :doNotUseEastAsianBreakRules, to: :do_not_use_east_asian_break_rules
      map_element :useWord2002TableStyleRules, to: :use_word2002_table_style_rules
      map_element :growAutofit, to: :grow_autofit
      map_element :useFELayout, to: :use_fe_layout
      map_element :useNormalStyleForList, to: :use_normal_style_for_list
      map_element :doNotUseIndentAsNumberingTabStop, to: :do_not_use_indent_as_numbering_tab_stop
      map_element :useAltKinsokuLineBreakRules, to: :use_alt_kinsoku_line_break_rules
      map_element :allowSpaceOfSameStyleInTable, to: :allow_space_of_same_style_in_table
      map_element :doNotSuppressIndentation, to: :do_not_suppress_indentation
      map_element :doNotAutofitConstrainedTables, to: :do_not_autofit_constrained_tables
      map_element :autofitToFirstFixedWidthCell, to: :autofit_to_first_fixed_width_cell
      map_element :underlineTabInNumList, to: :underline_tab_in_num_list
      map_element :displayHangulFixedWidth, to: :display_hangul_fixed_width
      map_element :splitPgBreakAndParaMark, to: :split_pg_break_and_para_mark
      map_element :doNotVertAlignCellWithSp, to: :do_not_vert_align_cell_with_sp
      map_element :doNotBreakConstrainedForcedTable, to: :do_not_break_constrained_forced_table
      map_element :doNotVertAlignInTxbx, to: :do_not_vert_align_in_txbx
      map_element :useAnsiKerningPairs, to: :use_ansi_kerning_pairs
      map_element :cachedColBalance, to: :cached_col_balance
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_compat)
  end
end

CTCompat.register_class_with_id
