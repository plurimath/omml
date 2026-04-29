# frozen_string_literal: true

module Omml
  module Models
    class EGContentRunContent < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        attribute :custom_xml, :ct_custom_xml_run
        attribute :smart_tag, :ct_smart_tag_run
        attribute :sdt, :ct_sdt_run
        attribute :r, :ct_r
        import_model_attributes :eg_run_level_elts
      end

      xml do
        type_name "EG_ContentRunContent"
        map_element :customXml, to: :custom_xml, render_empty: true
        map_element :smartTag, to: :smart_tag, render_empty: true
        map_element :sdt, to: :sdt, render_empty: true
        map_element :r, to: :r, render_empty: true
        import_model_mappings :eg_run_level_elts
      end
    end

    Omml::Configuration.register_model(EGContentRunContent)
  end
end
