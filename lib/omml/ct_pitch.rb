# frozen_string_literal: true

require "lutaml/model"
require_relative "st_pitch"
class CTPitch < Lutaml::Model::Serializable
  attribute :val, :st_pitch

  xml do
    root "Pitch"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_pitch)
  end
end

CTPitch.register_class_with_id
