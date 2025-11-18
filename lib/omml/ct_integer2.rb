# frozen_string_literal: true

require "lutaml/model"
require_relative "st_integer2"
class CTInteger2 < Lutaml::Model::Serializable
  attribute :val, :st_integer2

  xml do
    root "Integer2"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_integer2)
  end
end

CTInteger2.register_class_with_id
