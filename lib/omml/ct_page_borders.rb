# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_border"
require_relative "st_page_border_z_order"
require_relative "st_page_border_display"
require_relative "st_page_border_offset"
class CTPageBorders < Lutaml::Model::Serializable
  attribute :top, :ct_border, collection: 0..1
  attribute :left, :ct_border, collection: 0..1
  attribute :bottom, :ct_border, collection: 0..1
  attribute :right, :ct_border, collection: 0..1
  attribute :z_order, :st_page_border_z_order
  attribute :display, :st_page_border_display
  attribute :offset_from, :st_page_border_offset

  xml do
    root "PageBorders"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :top, to: :top
      map_element :left, to: :left
      map_element :bottom, to: :bottom
      map_element :right, to: :right
    end
    map_attribute :zOrder, to: :z_order
    map_attribute :display, to: :display
    map_attribute :offsetFrom, to: :offset_from
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_page_borders)
  end
end

CTPageBorders.register_class_with_id
