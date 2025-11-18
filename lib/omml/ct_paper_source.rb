# frozen_string_literal: true

require "lutaml/model"
require_relative "st_decimal_number"
class CTPaperSource < Lutaml::Model::Serializable
  attribute :first, :st_decimal_number
  attribute :other, :st_decimal_number

  xml do
    root "PaperSource"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :first, to: :first
    map_attribute :other, to: :other
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_paper_source)
  end
end

CTPaperSource.register_class_with_id
