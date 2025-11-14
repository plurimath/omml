# frozen_string_literal: true

require_relative "ct_custom_geometry2_d"
require_relative "ct_preset_geometry2_d"
class EGGeometry < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :cust_geom, :ct_custom_geometry2_d, collection: 1..1
    attribute :prst_geom, :ct_preset_geometry2_d, collection: 1..1
  end

  xml do
    no_root
    map_element :custGeom, to: :cust_geom
    map_element :prstGeom, to: :prst_geom
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_geometry)
  end
end

EGGeometry.register_class_with_id
