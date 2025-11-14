# frozen_string_literal: true

require "lutaml/model"
require_relative "st_long_hex_number"
class CTLongHexNumber < Lutaml::Model::Serializable
  attribute :val, :st_long_hex_number

  xml do
    root "LongHexNumber"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_long_hex_number)
  end
end

CTLongHexNumber.register_class_with_id
