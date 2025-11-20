# frozen_string_literal: true

require "lutaml/model"
require_relative "st_lang"
require_relative "st_string"
class CTKinsoku < Lutaml::Model::Serializable
  attribute :lang, :st_lang
  attribute :val, :st_string

  xml do
    root "Kinsoku", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :lang, to: :lang
    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_kinsoku)
  end
end

CTKinsoku.register_class_with_id
