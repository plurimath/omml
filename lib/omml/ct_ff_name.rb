# frozen_string_literal: true

require "lutaml/model"
require_relative "st_ff_name"
class CTFFName < Lutaml::Model::Serializable
  attribute :val, :st_ff_name

  xml do
    root "FFName"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ff_name)
  end
end

CTFFName.register_class_with_id
