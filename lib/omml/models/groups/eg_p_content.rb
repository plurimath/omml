# frozen_string_literal: true

require_relative "eg_content_run_content"
require_relative "../ct_simple_field"
require_relative "../ct_hyperlink"
require_relative "../ct_rel"
module Omml
  module Models
    class EGPContent < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        import_model_attributes :eg_content_run_content
        attribute :fld_simple, :ct_simple_field, collection: 0..Float::INFINITY
        attribute :hyperlink, :ct_hyperlink
        attribute :sub_doc, :ct_rel
      end

      xml do
        type_name "EG_PContent"
        import_model_mappings :eg_content_run_content
        map_element :fldSimple, to: :fld_simple
        map_element :hyperlink, to: :hyperlink, render_empty: true
        map_element :subDoc, to: :sub_doc, render_empty: true
      end
    end

    Omml::Configuration.register_model(EGPContent)
  end
end
