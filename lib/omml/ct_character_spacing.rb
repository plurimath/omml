# frozen_string_literal: true

require "lutaml/model"
require_relative "st_character_spacing"
class CTCharacterSpacing < Lutaml::Model::Serializable
  attribute :val, :st_character_spacing

  xml do
    root "CharacterSpacing"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_character_spacing)
  end
end

CTCharacterSpacing.register_class_with_id
