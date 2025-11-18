# frozen_string_literal: true

require "lutaml/model"
require_relative "st_adj_coordinate"
require_relative "st_adj_angle"
class CTPath2DArcTo < Lutaml::Model::Serializable
  attribute :w_r, :st_adj_coordinate
  attribute :h_r, :st_adj_coordinate
  attribute :st_ang, :st_adj_angle
  attribute :sw_ang, :st_adj_angle

  xml do
    root "Path2DArcTo"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :wR, to: :w_r
    map_attribute :hR, to: :h_r
    map_attribute :stAng, to: :st_ang
    map_attribute :swAng, to: :sw_ang
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_path2_d_arc_to)
  end
end

CTPath2DArcTo.register_class_with_id
