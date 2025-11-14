# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
class CTAttr < Lutaml::Model::Serializable
  attribute :uri, :st_string
  attribute :name, :st_string
  attribute :val, :st_string

  xml do
    root "Attr"

    map_attribute :uri, to: :uri
    map_attribute :name, to: :name
    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_attr)
  end
end

CTAttr.register_class_with_id
