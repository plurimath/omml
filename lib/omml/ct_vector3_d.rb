# frozen_string_literal: true

require "lutaml/model"
require_relative "st_coordinate"
class CTVector3D < Lutaml::Model::Serializable
  attribute :dx, :st_coordinate
  attribute :dy, :st_coordinate
  attribute :dz, :st_coordinate

  xml do
    root "Vector3D"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :dx, to: :dx
    map_attribute :dy, to: :dy
    map_attribute :dz, to: :dz
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_vector3_d)
  end
end

CTVector3D.register_class_with_id
