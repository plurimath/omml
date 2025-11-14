# frozen_string_literal: true

require "lutaml/model"
require_relative "st_macro_name"
class CTMacroName < Lutaml::Model::Serializable
  attribute :val, :st_macro_name

  xml do
    root "MacroName"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_macro_name)
  end
end

CTMacroName.register_class_with_id
