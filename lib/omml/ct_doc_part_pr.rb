# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_doc_part_name"
require_relative "ct_string"
require_relative "ct_doc_part_category"
require_relative "ct_doc_part_types"
require_relative "ct_doc_part_behaviors"
require_relative "ct_guid"
class CTDocPartPr < Lutaml::Model::Serializable
  choice(min: 1, max: Float::INFINITY) do
    attribute :name, :ct_doc_part_name, collection: 1..1
    attribute :style, :ct_string
    attribute :category, :ct_doc_part_category
    attribute :types, :ct_doc_part_types
    attribute :behaviors, :ct_doc_part_behaviors
    attribute :description, :ct_string
    attribute :guid, :ct_guid
  end

  xml do
    root "DocPartPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_element :name, to: :name
    map_element :style, to: :style
    map_element :category, to: :category
    map_element :types, to: :types
    map_element :behaviors, to: :behaviors
    map_element :description, to: :description
    map_element :guid, to: :guid
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_part_pr)
  end
end

CTDocPartPr.register_class_with_id
