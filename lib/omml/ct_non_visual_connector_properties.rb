# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_connector_locking"
require_relative "ct_connection"
require_relative "ct_office_art_extension_list"
class CTNonVisualConnectorProperties < Lutaml::Model::Serializable
  attribute :cxn_sp_locks, :ct_connector_locking, collection: 0..1
  attribute :st_cxn, :ct_connection, collection: 0..1
  attribute :end_cxn, :ct_connection, collection: 0..1
  attribute :ext_lst, :ct_office_art_extension_list, collection: 0..1

  xml do
    root "NonVisualConnectorProperties"

    sequence do
      map_element :cxnSpLocks, to: :cxn_sp_locks
      map_element :stCxn, to: :st_cxn
      map_element :endCxn, to: :end_cxn
      map_element :extLst, to: :ext_lst
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_non_visual_connector_properties)
  end
end

CTNonVisualConnectorProperties.register_class_with_id
