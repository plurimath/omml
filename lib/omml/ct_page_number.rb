# frozen_string_literal: true

require "lutaml/model"
require_relative "st_number_format"
require_relative "st_decimal_number"
require_relative "st_chapter_sep"
class CTPageNumber < Lutaml::Model::Serializable
  attribute :fmt, :st_number_format
  attribute :start, :st_decimal_number
  attribute :chap_style, :st_decimal_number
  attribute :chap_sep, :st_chapter_sep

  xml do
    root "PageNumber", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :fmt, to: :fmt
    map_attribute :start, to: :start
    map_attribute :chapStyle, to: :chap_style
    map_attribute :chapSep, to: :chap_sep
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_page_number)
  end
end

CTPageNumber.register_class_with_id
