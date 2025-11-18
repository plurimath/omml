# frozen_string_literal: true

require "lutaml/model"
require_relative "st_adj_coordinate"
class CTGeomRect < Lutaml::Model::Serializable
  attribute :l, :st_adj_coordinate
  attribute :t, :st_adj_coordinate
  attribute :r, :st_adj_coordinate
  attribute :b, :st_adj_coordinate

  xml do
    root "GeomRect"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :l, to: :l
    map_attribute :t, to: :t
    map_attribute :r, to: :r
    map_attribute :b, to: :b
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_geom_rect)
  end
end

CTGeomRect.register_class_with_id
