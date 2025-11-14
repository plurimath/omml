# frozen_string_literal: true

require_relative "ct_bookmark"
require_relative "ct_markup_range"
require_relative "ct_move_bookmark"
require_relative "ct_track_change"
require_relative "ct_markup"
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
    no_root
    map_element :bookmarkStart, to: :bookmark_start
    map_element :bookmarkEnd, to: :bookmark_end
    map_element :moveFromRangeStart, to: :move_from_range_start
    map_element :moveFromRangeEnd, to: :move_from_range_end
    map_element :moveToRangeStart, to: :move_to_range_start
    map_element :moveToRangeEnd, to: :move_to_range_end
    map_element :commentRangeStart, to: :comment_range_start
    map_element :commentRangeEnd, to: :comment_range_end
    map_element :customXmlInsRangeStart, to: :custom_xml_ins_range_start
    map_element :customXmlInsRangeEnd, to: :custom_xml_ins_range_end
    map_element :customXmlDelRangeStart, to: :custom_xml_del_range_start
    map_element :customXmlDelRangeEnd, to: :custom_xml_del_range_end
    map_element :customXmlMoveFromRangeStart, to: :custom_xml_move_from_range_start
    map_element :customXmlMoveFromRangeEnd, to: :custom_xml_move_from_range_end
    map_element :customXmlMoveToRangeStart, to: :custom_xml_move_to_range_start
    map_element :customXmlMoveToRangeEnd, to: :custom_xml_move_to_range_end
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_range_markup_elements)
  end
end

EGRangeMarkupElements.register_class_with_id
