# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
class CTDataBinding < Lutaml::Model::Serializable
  attribute :prefix_mappings, :st_string
  attribute :xpath, :st_string
  attribute :store_item_id, :st_string

  xml do
    root "DataBinding"

    map_attribute :prefixMappings, to: :prefix_mappings
    map_attribute :xpath, to: :xpath
    map_attribute :storeItemID, to: :store_item_id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_data_binding)
  end
end

CTDataBinding.register_class_with_id
