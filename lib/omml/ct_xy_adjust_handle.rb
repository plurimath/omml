# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_adj_point2_d"
require_relative "st_geom_guide_name"
require_relative "st_adj_coordinate"
class CTXYAdjustHandle < Lutaml::Model::Serializable
  attribute :pos, :ct_adj_point2_d, collection: 1..1
  attribute :gd_ref_x, :st_geom_guide_name
  attribute :min_x, :st_adj_coordinate
  attribute :max_x, :st_adj_coordinate
  attribute :gd_ref_y, :st_geom_guide_name
  attribute :min_y, :st_adj_coordinate
  attribute :max_y, :st_adj_coordinate

  xml do
    root "XYAdjustHandle"

    sequence do
      map_element :pos, to: :pos
    end
    map_attribute :gdRefX, to: :gd_ref_x
    map_attribute :minX, to: :min_x
    map_attribute :maxX, to: :max_x
    map_attribute :gdRefY, to: :gd_ref_y
    map_attribute :minY, to: :min_y
    map_attribute :maxY, to: :max_y
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_xy_adjust_handle)
  end
end

CTXYAdjustHandle.register_class_with_id
