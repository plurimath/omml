# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
require_relative "st_on_off"
class CTLevelText < Lutaml::Model::Serializable
  attribute :val, :st_string
  attribute :null, :st_on_off

  xml do
    root "LevelText"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
    map_attribute :null, to: :null
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_level_text)
  end
end

CTLevelText.register_class_with_id
