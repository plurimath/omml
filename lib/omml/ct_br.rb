# frozen_string_literal: true

require "lutaml/model"
require_relative "st_br_type"
require_relative "st_br_clear"
class CTBr < Lutaml::Model::Serializable
  attribute :type, :st_br_type
  attribute :clear, :st_br_clear

  xml do
    root "Br"

    map_attribute :type, to: :type
    map_attribute :clear, to: :clear
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_br)
  end
end

CTBr.register_class_with_id
