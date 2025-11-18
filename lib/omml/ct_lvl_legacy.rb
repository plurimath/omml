# frozen_string_literal: true

require "lutaml/model"
require_relative "st_on_off"
require_relative "st_twips_measure"
require_relative "st_signed_twips_measure"
class CTLvlLegacy < Lutaml::Model::Serializable
  attribute :legacy, :st_on_off
  attribute :legacy_space, :st_twips_measure
  attribute :legacy_indent, :st_signed_twips_measure

  xml do
    root "LvlLegacy"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :legacy, to: :legacy
    map_attribute :legacySpace, to: :legacy_space
    map_attribute :legacyIndent, to: :legacy_indent
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_lvl_legacy)
  end
end

CTLvlLegacy.register_class_with_id
