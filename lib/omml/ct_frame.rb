# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_rel"
require_relative "ct_pixels_measure"
require_relative "ct_frame_scrollbar"
require_relative "ct_on_off"
class CTFrame < Lutaml::Model::Serializable
  attribute :sz, :ct_string, collection: 0..1
  attribute :name, :ct_string, collection: 0..1
  attribute :source_file_name, :ct_rel, collection: 0..1
  attribute :mar_w, :ct_pixels_measure, collection: 0..1
  attribute :mar_h, :ct_pixels_measure, collection: 0..1
  attribute :scrollbar, :ct_frame_scrollbar, collection: 0..1
  attribute :no_resize_allowed, :ct_on_off, collection: 0..1
  attribute :linked_to_file, :ct_on_off, collection: 0..1

  xml do
    root "Frame"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :sz, to: :sz
      map_element :name, to: :name
      map_element :sourceFileName, to: :source_file_name
      map_element :marW, to: :mar_w
      map_element :marH, to: :mar_h
      map_element :scrollbar, to: :scrollbar
      map_element :noResizeAllowed, to: :no_resize_allowed
      map_element :linkedToFile, to: :linked_to_file
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_frame)
  end
end

CTFrame.register_class_with_id
