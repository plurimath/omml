# frozen_string_literal: true

require "lutaml/model"
require_relative "st_signed_twips_measure"
require_relative "st_decimal_number"
require_relative "st_twips_measure"
class CTInd < Lutaml::Model::Serializable
  attribute :left, :st_signed_twips_measure
  attribute :left_chars, :st_decimal_number
  attribute :right, :st_signed_twips_measure
  attribute :right_chars, :st_decimal_number
  attribute :hanging, :st_twips_measure
  attribute :hanging_chars, :st_decimal_number
  attribute :first_line, :st_twips_measure
  attribute :first_line_chars, :st_decimal_number

  xml do
    root "Ind", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :left, to: :left
    map_attribute :leftChars, to: :left_chars
    map_attribute :right, to: :right
    map_attribute :rightChars, to: :right_chars
    map_attribute :hanging, to: :hanging
    map_attribute :hangingChars, to: :hanging_chars
    map_attribute :firstLine, to: :first_line
    map_attribute :firstLineChars, to: :first_line_chars
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ind)
  end
end

CTInd.register_class_with_id
