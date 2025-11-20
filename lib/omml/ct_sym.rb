# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
require_relative "st_short_hex_number"
class CTSym < Lutaml::Model::Serializable
  attribute :font, :st_string
  attribute :char, :st_short_hex_number

  xml do
    root "Sym", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :font, to: :font
    map_attribute :char, to: :char
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sym)
  end
end

CTSym.register_class_with_id
