# frozen_string_literal: true

require "lutaml/model"
require_relative "st_integer255"
class CTInteger255 < Lutaml::Model::Serializable
  attribute :val, :st_integer255

  xml do
    root "Integer255"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_integer255)
  end
end

CTInteger255.register_class_with_id
