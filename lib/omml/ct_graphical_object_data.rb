# frozen_string_literal: true

require "lutaml/model"
require_relative "token"
class CTGraphicalObjectData < Lutaml::Model::Serializable
  attribute :uri, :token

  xml do
    root "GraphicalObjectData"

    map_attribute :uri, to: :uri
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_graphical_object_data)
  end
end

CTGraphicalObjectData.register_class_with_id
