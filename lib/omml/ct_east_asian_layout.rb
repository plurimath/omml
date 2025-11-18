# frozen_string_literal: true

require "lutaml/model"
require_relative "st_decimal_number"
require_relative "st_on_off"
require_relative "st_combine_brackets"
class CTEastAsianLayout < Lutaml::Model::Serializable
  attribute :id, :st_decimal_number
  attribute :combine, :st_on_off
  attribute :combine_brackets, :st_combine_brackets
  attribute :vert, :st_on_off
  attribute :vert_compress, :st_on_off

  xml do
    root "EastAsianLayout"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :id, to: :id
    map_attribute :combine, to: :combine
    map_attribute :combineBrackets, to: :combine_brackets
    map_attribute :vert, to: :vert
    map_attribute :vertCompress, to: :vert_compress
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_east_asian_layout)
  end
end

CTEastAsianLayout.register_class_with_id
