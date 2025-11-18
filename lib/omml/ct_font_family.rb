# frozen_string_literal: true

require "lutaml/model"
require_relative "st_font_family"
class CTFontFamily < Lutaml::Model::Serializable
  attribute :val, :st_font_family

  xml do
    root "FontFamily"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_font_family)
  end
end

CTFontFamily.register_class_with_id
