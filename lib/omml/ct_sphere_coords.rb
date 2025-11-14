# frozen_string_literal: true

require "lutaml/model"
require_relative "st_positive_fixed_angle"
class CTSphereCoords < Lutaml::Model::Serializable
  attribute :lat, :st_positive_fixed_angle
  attribute :lon, :st_positive_fixed_angle
  attribute :rev, :st_positive_fixed_angle

  xml do
    root "SphereCoords"

    map_attribute :lat, to: :lat
    map_attribute :lon, to: :lon
    map_attribute :rev, to: :rev
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sphere_coords)
  end
end

CTSphereCoords.register_class_with_id
