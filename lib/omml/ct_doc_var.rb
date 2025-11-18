# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
class CTDocVar < Lutaml::Model::Serializable
  attribute :name, :st_string
  attribute :val, :st_string

  xml do
    root "DocVar"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :name, to: :name
    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_var)
  end
end

CTDocVar.register_class_with_id
