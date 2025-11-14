# frozen_string_literal: true

require "lutaml/model"
require_relative "st_twips_measure"
require_relative "st_decimal_number"
require_relative "st_on_off"
require_relative "st_signed_twips_measure"
require_relative "st_line_spacing_rule"
class CTSpacing < Lutaml::Model::Serializable
  attribute :before, :st_twips_measure
  attribute :before_lines, :st_decimal_number
  attribute :before_autospacing, :st_on_off
  attribute :after, :st_twips_measure
  attribute :after_lines, :st_decimal_number
  attribute :after_autospacing, :st_on_off
  attribute :line, :st_signed_twips_measure
  attribute :line_rule, :st_line_spacing_rule

  xml do
    root "Spacing"

    map_attribute :before, to: :before
    map_attribute :beforeLines, to: :before_lines
    map_attribute :beforeAutospacing, to: :before_autospacing
    map_attribute :after, to: :after
    map_attribute :afterLines, to: :after_lines
    map_attribute :afterAutospacing, to: :after_autospacing
    map_attribute :line, to: :line
    map_attribute :lineRule, to: :line_rule
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_spacing)
  end
end

CTSpacing.register_class_with_id
