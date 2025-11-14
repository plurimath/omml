# frozen_string_literal: true

require "lutaml/model"
require_relative "st_text_effect"
class CTTextEffect < Lutaml::Model::Serializable
  attribute :val, :st_text_effect

  xml do
    root "TextEffect"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_text_effect)
  end
end

CTTextEffect.register_class_with_id
