# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_point2_d"
require_relative "ct_pos_h"
require_relative "ct_pos_v"
require_relative "ct_positive_size2_d"
require_relative "ct_effect_extent"
require_relative "eg_wrap_type"
require_relative "ct_non_visual_drawing_props"
require_relative "ct_non_visual_graphic_frame_properties"
require_relative "ct_graphical_object"
require_relative "st_wrap_distance"
require_relative "unsigned_int"
class CTAnchor < Lutaml::Model::Serializable
  attribute :simple_pos, :ct_point2_d
  attribute :position_h, :ct_pos_h
  attribute :position_v, :ct_pos_v
  attribute :extent, :ct_positive_size2_d
  attribute :effect_extent, :ct_effect_extent, collection: 0..1
  import_model_attributes :eg_wrap_type
  attribute :doc_pr, :ct_non_visual_drawing_props, collection: 1..1
  attribute :c_nv_graphic_frame_pr, :ct_non_visual_graphic_frame_properties, collection: 0..1
  attribute :graphic, :ct_graphical_object, collection: 1..1
  attribute :dist_t, :st_wrap_distance
  attribute :dist_b, :st_wrap_distance
  attribute :dist_l, :st_wrap_distance
  attribute :dist_r, :st_wrap_distance
  attribute :simple_pos, :boolean
  attribute :relative_height, :unsigned_int
  attribute :behind_doc, :boolean
  attribute :locked, :boolean
  attribute :layout_in_cell, :boolean
  attribute :hidden, :boolean
  attribute :allow_overlap, :boolean

  xml do
    root "Anchor"

    sequence do
      map_element :simplePos, to: :simple_pos
      map_element :positionH, to: :position_h
      map_element :positionV, to: :position_v
      map_element :extent, to: :extent
      map_element :effectExtent, to: :effect_extent
      import_model_mappings :eg_wrap_type
      map_element :docPr, to: :doc_pr
      map_element :cNvGraphicFramePr, to: :c_nv_graphic_frame_pr
      map_element :graphic, to: :graphic
    end
    map_attribute :distT, to: :dist_t
    map_attribute :distB, to: :dist_b
    map_attribute :distL, to: :dist_l
    map_attribute :distR, to: :dist_r
    map_attribute :simplePos, to: :simple_pos
    map_attribute :relativeHeight, to: :relative_height
    map_attribute :behindDoc, to: :behind_doc
    map_attribute :locked, to: :locked
    map_attribute :layoutInCell, to: :layout_in_cell
    map_attribute :hidden, to: :hidden
    map_attribute :allowOverlap, to: :allow_overlap
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_anchor)
  end
end

CTAnchor.register_class_with_id
