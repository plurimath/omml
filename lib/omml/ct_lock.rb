# frozen_string_literal: true

require "lutaml/model"
require_relative "st_lock"
class CTLock < Lutaml::Model::Serializable
  attribute :val, :st_lock

  xml do
    root "Lock"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_lock)
  end
end

CTLock.register_class_with_id
