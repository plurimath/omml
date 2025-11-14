# frozen_string_literal: true

require_relative "ct_row"
require_relative "ct_custom_xml_row"
require_relative "ct_sdt_row"
require_relative "eg_run_level_elts"
class EGContentRowContent < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :tr, :ct_row, collection: 0..Float::INFINITY
    attribute :custom_xml, :ct_custom_xml_row
    attribute :sdt, :ct_sdt_row
    import_model_attributes :eg_run_level_elts
  end

  xml do
    no_root
    map_element :tr, to: :tr
    map_element :customXml, to: :custom_xml
    map_element :sdt, to: :sdt
    import_model_mappings :eg_run_level_elts
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_content_row_content)
  end
end

EGContentRowContent.register_class_with_id
