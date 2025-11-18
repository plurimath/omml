# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_hyperlink"
require_relative "ct_office_art_extension_list"
require_relative "st_drawing_element_id"
class CTNonVisualDrawingProps < Lutaml::Model::Serializable
  attribute :hlink_click, :ct_hyperlink, collection: 0..1
  attribute :hlink_hover, :ct_hyperlink, collection: 0..1
  attribute :ext_lst, :ct_office_art_extension_list, collection: 0..1
  attribute :id, :st_drawing_element_id
  attribute :name, :string
  attribute :descr, :string
  attribute :hidden, :boolean

  xml do
    root "NonVisualDrawingProps"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :hlinkClick, to: :hlink_click
      map_element :hlinkHover, to: :hlink_hover
      map_element :extLst, to: :ext_lst
    end
    map_attribute :id, to: :id
    map_attribute :name, to: :name
    map_attribute :descr, to: :descr
    map_attribute :hidden, to: :hidden
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_non_visual_drawing_props)
  end
end

CTNonVisualDrawingProps.register_class_with_id
