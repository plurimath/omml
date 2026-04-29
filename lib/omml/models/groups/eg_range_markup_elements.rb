# frozen_string_literal: true

module Omml
  module Models
    class EGRangeMarkupElements < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        attribute :bookmark_start, :ct_bookmark
        attribute :bookmark_end, :ct_markup_range
        attribute :move_from_range_start, :ct_move_bookmark
        attribute :move_from_range_end, :ct_markup_range
        attribute :move_to_range_start, :ct_move_bookmark
        attribute :move_to_range_end, :ct_markup_range
        attribute :comment_range_start, :ct_markup_range
        attribute :comment_range_end, :ct_markup_range
        attribute :custom_xml_ins_range_start, :ct_track_change
        attribute :custom_xml_ins_range_end, :ct_markup
        attribute :custom_xml_del_range_start, :ct_track_change
        attribute :custom_xml_del_range_end, :ct_markup
        attribute :custom_xml_move_from_range_start, :ct_track_change
        attribute :custom_xml_move_from_range_end, :ct_markup
        attribute :custom_xml_move_to_range_start, :ct_track_change
        attribute :custom_xml_move_to_range_end, :ct_markup
      end

      xml do
        type_name "EG_RangeMarkupElements"
        map_element :bookmarkStart, to: :bookmark_start, render_empty: true
        map_element :bookmarkEnd, to: :bookmark_end, render_empty: true
        map_element :moveFromRangeStart, to: :move_from_range_start,
                                         render_empty: true
        map_element :moveFromRangeEnd, to: :move_from_range_end,
                                       render_empty: true
        map_element :moveToRangeStart, to: :move_to_range_start,
                                       render_empty: true
        map_element :moveToRangeEnd, to: :move_to_range_end, render_empty: true
        map_element :commentRangeStart, to: :comment_range_start,
                                        render_empty: true
        map_element :commentRangeEnd, to: :comment_range_end, render_empty: true
        map_element :customXmlInsRangeStart, to: :custom_xml_ins_range_start,
                                             render_empty: true
        map_element :customXmlInsRangeEnd, to: :custom_xml_ins_range_end,
                                           render_empty: true
        map_element :customXmlDelRangeStart, to: :custom_xml_del_range_start,
                                             render_empty: true
        map_element :customXmlDelRangeEnd, to: :custom_xml_del_range_end,
                                           render_empty: true
        map_element :customXmlMoveFromRangeStart,
                    to: :custom_xml_move_from_range_start, render_empty: true
        map_element :customXmlMoveFromRangeEnd,
                    to: :custom_xml_move_from_range_end, render_empty: true
        map_element :customXmlMoveToRangeStart,
                    to: :custom_xml_move_to_range_start, render_empty: true
        map_element :customXmlMoveToRangeEnd,
                    to: :custom_xml_move_to_range_end, render_empty: true
      end
    end

    Omml::Configuration.register_model(EGRangeMarkupElements)
  end
end
