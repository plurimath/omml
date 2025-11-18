# frozen_string_literal: true

require "lutaml/model"
require_relative "st_twips_measure"
require_relative "st_page_orientation"
require_relative "st_decimal_number"
class CTPageSz < Lutaml::Model::Serializable
  attribute :w, :st_twips_measure
  attribute :h, :st_twips_measure
  attribute :orient, :st_page_orientation
  attribute :code, :st_decimal_number

  xml do
    root "PageSz"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :w, to: :w
    map_attribute :h, to: :h
    map_attribute :orient, to: :orient
    map_attribute :code, to: :code
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_page_sz)
  end
end

CTPageSz.register_class_with_id
