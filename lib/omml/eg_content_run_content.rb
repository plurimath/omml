# frozen_string_literal: true

require_relative "ct_custom_xml_run"
require_relative "ct_smart_tag_run"
require_relative "ct_sdt_run"
require_relative "ct_r"
require_relative "eg_run_level_elts"
class EGContentRunContent < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :custom_xml, :ct_custom_xml_run
    attribute :smart_tag, :ct_smart_tag_run
    attribute :sdt, :ct_sdt_run
    attribute :r, :ct_r
    import_model_attributes :eg_run_level_elts
  end

  xml do
    no_root
    map_element :customXml, to: :custom_xml
    map_element :smartTag, to: :smart_tag
    map_element :sdt, to: :sdt
    map_element :r, to: :r
    import_model_mappings :eg_run_level_elts
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_content_run_content)
  end
end

EGContentRunContent.register_class_with_id
