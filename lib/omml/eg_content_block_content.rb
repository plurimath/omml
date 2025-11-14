# frozen_string_literal: true

require_relative "ct_custom_xml_block"
require_relative "ct_sdt_block"
require_relative "ct_p"
require_relative "ct_tbl"
require_relative "eg_run_level_elts"
class EGContentBlockContent < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :custom_xml, :ct_custom_xml_block
    attribute :sdt, :ct_sdt_block
    attribute :p, :ct_p, collection: 0..Float::INFINITY
    attribute :tbl, :ct_tbl, collection: 0..Float::INFINITY
    import_model_attributes :eg_run_level_elts
  end

  xml do
    no_root
    map_element :customXml, to: :custom_xml
    map_element :sdt, to: :sdt
    map_element :p, to: :p
    map_element :tbl, to: :tbl
    import_model_mappings :eg_run_level_elts
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_content_block_content)
  end
end

EGContentBlockContent.register_class_with_id
