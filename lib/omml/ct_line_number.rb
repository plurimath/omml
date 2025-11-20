# frozen_string_literal: true

require "lutaml/model"
require_relative "st_decimal_number"
require_relative "st_twips_measure"
require_relative "st_line_number_restart"
class CTLineNumber < Lutaml::Model::Serializable
  attribute :count_by, :st_decimal_number
  attribute :start, :st_decimal_number
  attribute :distance, :st_twips_measure
  attribute :restart, :st_line_number_restart

  xml do
    root "LineNumber", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :countBy, to: :count_by
    map_attribute :start, to: :start
    map_attribute :distance, to: :distance
    map_attribute :restart, to: :restart
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_line_number)
  end
end

CTLineNumber.register_class_with_id
