# frozen_string_literal: true

require "lutaml/model"
require_relative "st_coordinate"
class CTPoint3D < Lutaml::Model::Serializable
  attribute :x, :st_coordinate
  attribute :y, :st_coordinate
  attribute :z, :st_coordinate

  xml do
    root "Point3D", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :x, to: :x
    map_attribute :y, to: :y
    map_attribute :z, to: :z
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_point3_d)
  end
end

CTPoint3D.register_class_with_id
