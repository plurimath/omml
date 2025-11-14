# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
class CTString < Lutaml::Model::Serializable
  attribute :val, :st_string

  xml do
    root "String"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_string)
  end
end

CTString.register_class_with_id
