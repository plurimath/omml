# frozen_string_literal: true

require_relative "ct_rel"
require_relative "st_guid"
require_relative "st_on_off"
class CTFontRel < CTRel
  attribute :font_key, :st_guid
  attribute :subsetted, :st_on_off

  xml do
    root "FontRel"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :fontKey, to: :font_key
    map_attribute :subsetted, to: :subsetted
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_font_rel)
  end
end

CTFontRel.register_class_with_id
