# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_adj_point2_d"
require_relative "st_geom_guide_name"
require_relative "st_adj_coordinate"
require_relative "st_adj_angle"
class CTPolarAdjustHandle < Lutaml::Model::Serializable
  attribute :pos, :ct_adj_point2_d, collection: 1..1
  attribute :gd_ref_r, :st_geom_guide_name
  attribute :min_r, :st_adj_coordinate
  attribute :max_r, :st_adj_coordinate
  attribute :gd_ref_ang, :st_geom_guide_name
  attribute :min_ang, :st_adj_angle
  attribute :max_ang, :st_adj_angle

  xml do
    root "PolarAdjustHandle", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :pos, to: :pos
    end
    map_attribute :gdRefR, to: :gd_ref_r
    map_attribute :minR, to: :min_r
    map_attribute :maxR, to: :max_r
    map_attribute :gdRefAng, to: :gd_ref_ang
    map_attribute :minAng, to: :min_ang
    map_attribute :maxAng, to: :max_ang
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_polar_adjust_handle)
  end
end

CTPolarAdjustHandle.register_class_with_id
