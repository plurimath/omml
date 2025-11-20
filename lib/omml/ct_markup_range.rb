# frozen_string_literal: true

require_relative "ct_markup"
require_relative "st_displaced_by_custom_xml"
class CTMarkupRange < CTMarkup
  attribute :displaced_by_custom_xml, :st_displaced_by_custom_xml

  xml do
    root "MarkupRange", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :displacedByCustomXml, to: :displaced_by_custom_xml
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_markup_range)
  end
end

CTMarkupRange.register_class_with_id
