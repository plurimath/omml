# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_positive_size2_d"
require_relative "ct_effect_extent"
require_relative "ct_non_visual_drawing_props"
require_relative "ct_non_visual_graphic_frame_properties"
require_relative "ct_graphical_object"
require_relative "st_wrap_distance"
class CTInline < Lutaml::Model::Serializable
  attribute :extent, :ct_positive_size2_d
  attribute :effect_extent, :ct_effect_extent, collection: 0..1
  attribute :doc_pr, :ct_non_visual_drawing_props, collection: 1..1
  attribute :c_nv_graphic_frame_pr, :ct_non_visual_graphic_frame_properties, collection: 0..1
  attribute :graphic, :ct_graphical_object, collection: 1..1
  attribute :dist_t, :st_wrap_distance
  attribute :dist_b, :st_wrap_distance
  attribute :dist_l, :st_wrap_distance
  attribute :dist_r, :st_wrap_distance

  xml do
    root "Inline"

    sequence do
      map_element :extent, to: :extent
      map_element :effectExtent, to: :effect_extent
      map_element :docPr, to: :doc_pr
      map_element :cNvGraphicFramePr, to: :c_nv_graphic_frame_pr
      map_element :graphic, to: :graphic
    end
    map_attribute :distT, to: :dist_t
    map_attribute :distB, to: :dist_b
    map_attribute :distL, to: :dist_l
    map_attribute :distR, to: :dist_r
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_inline)
  end
end

CTInline.register_class_with_id
