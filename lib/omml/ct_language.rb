# frozen_string_literal: true

require "lutaml/model"
require_relative "st_lang"
class CTLanguage < Lutaml::Model::Serializable
  attribute :val, :st_lang
  attribute :east_asia, :st_lang
  attribute :bidi, :st_lang

  xml do
    root "Language"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
    map_attribute :eastAsia, to: :east_asia
    map_attribute :bidi, to: :bidi
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_language)
  end
end

CTLanguage.register_class_with_id
