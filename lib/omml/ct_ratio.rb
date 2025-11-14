# frozen_string_literal: true

require "lutaml/model"
require_relative "long"
class CTRatio < Lutaml::Model::Serializable
  attribute :n, :long
  attribute :d, :long

  xml do
    root "Ratio"

    map_attribute :n, to: :n
    map_attribute :d, to: :d
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ratio)
  end
end

CTRatio.register_class_with_id
