# frozen_string_literal: true

require "lutaml/model"
require_relative "st_level_suffix"
class CTLevelSuffix < Lutaml::Model::Serializable
  attribute :val, :st_level_suffix

  xml do
    root "LevelSuffix", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_level_suffix)
  end
end

CTLevelSuffix.register_class_with_id
