# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_custom_xml_pr"
require_relative "eg_content_cell_content"
require_relative "st_string"
class CTCustomXmlCell < Lutaml::Model::Serializable
  attribute :custom_xml_pr, :ct_custom_xml_pr, collection: 0..1
  import_model_attributes :eg_content_cell_content
  attribute :uri, :st_string
  attribute :element, :st_string

  xml do
    root "CustomXmlCell"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :customXmlPr, to: :custom_xml_pr
      import_model_mappings :eg_content_cell_content
    end
    map_attribute :uri, to: :uri
    map_attribute :element, to: :element
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_custom_xml_cell)
  end
end

CTCustomXmlCell.register_class_with_id
