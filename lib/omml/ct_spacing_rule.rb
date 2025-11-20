# frozen_string_literal: true

require "lutaml/model"
require_relative "st_spacing_rule"
class CTSpacingRule < Lutaml::Model::Serializable
  attribute :val, :st_spacing_rule

  xml do
    root "SpacingRule", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_spacing_rule)
  end
end

CTSpacingRule.register_class_with_id
