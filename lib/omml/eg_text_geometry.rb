# frozen_string_literal: true

require_relative "ct_custom_geometry2_d"
require_relative "ct_preset_text_shape"
class EGTextGeometry < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :cust_geom, :ct_custom_geometry2_d, collection: 1..1
    attribute :prst_tx_warp, :ct_preset_text_shape, collection: 1..1
  end

  xml do
    no_root
    map_element :custGeom, to: :cust_geom
    map_element :prstTxWarp, to: :prst_tx_warp
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_text_geometry)
  end
end

EGTextGeometry.register_class_with_id
