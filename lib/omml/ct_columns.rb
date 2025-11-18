# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_column"
require_relative "st_on_off"
require_relative "st_twips_measure"
require_relative "st_decimal_number"
class CTColumns < Lutaml::Model::Serializable
  attribute :col, :ct_column, collection: 1..45
  attribute :equal_width, :st_on_off
  attribute :space, :st_twips_measure
  attribute :num, :st_decimal_number
  attribute :sep, :st_on_off

  xml do
    root "Columns"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :col, to: :col
    end
    map_attribute :equalWidth, to: :equal_width
    map_attribute :space, to: :space
    map_attribute :num, to: :num
    map_attribute :sep, to: :sep
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_columns)
  end
end

CTColumns.register_class_with_id
