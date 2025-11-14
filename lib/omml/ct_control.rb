# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
require_relative "st_relationship_id"
class CTControl < Lutaml::Model::Serializable
  attribute :name, :st_string
  attribute :shapeid, :st_string
  attribute :id, :st_relationship_id

  xml do
    root "Control"

    map_attribute :name, to: :name
    map_attribute :shapeid, to: :shapeid
    map_attribute :id, to: :id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_control)
  end
end

CTControl.register_class_with_id
