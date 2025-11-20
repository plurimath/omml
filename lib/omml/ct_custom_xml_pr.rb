# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_attr"
class CTCustomXmlPr < Lutaml::Model::Serializable
  attribute :placeholder, :ct_string, collection: 0..1
  attribute :attr, :ct_attr, collection: 0..Float::INFINITY

  xml do
    root "CustomXmlPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :placeholder, to: :placeholder
      map_element :attr, to: :attr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_custom_xml_pr)
  end
end

CTCustomXmlPr.register_class_with_id
