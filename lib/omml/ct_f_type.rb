# frozen_string_literal: true

require "lutaml/model"
require_relative "st_f_type"
class CTFType < Lutaml::Model::Serializable
  attribute :val, :st_f_type

  xml do
    root "FType"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_f_type)
  end
end

CTFType.register_class_with_id
