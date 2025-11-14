# frozen_string_literal: true

require_relative "ct_tc"
require_relative "ct_custom_xml_cell"
require_relative "ct_sdt_cell"
require_relative "eg_run_level_elts"
class EGContentCellContent < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :tc, :ct_tc, collection: 0..Float::INFINITY
    attribute :custom_xml, :ct_custom_xml_cell
    attribute :sdt, :ct_sdt_cell
    import_model_attributes :eg_run_level_elts
  end

  xml do
    no_root
    map_element :tc, to: :tc
    map_element :customXml, to: :custom_xml
    map_element :sdt, to: :sdt
    import_model_mappings :eg_run_level_elts
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_content_cell_content)
  end
end

EGContentCellContent.register_class_with_id
