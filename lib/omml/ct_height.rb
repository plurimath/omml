# frozen_string_literal: true

require "lutaml/model"
require_relative "st_twips_measure"
require_relative "st_height_rule"
class CTHeight < Lutaml::Model::Serializable
  attribute :val, :st_twips_measure
  attribute :h_rule, :st_height_rule

  xml do
    root "Height", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
    map_attribute :hRule, to: :h_rule
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_height)
  end
end

CTHeight.register_class_with_id
