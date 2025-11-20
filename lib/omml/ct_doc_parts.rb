# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_doc_part"
class CTDocParts < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :doc_part, :ct_doc_part, collection: 1..Float::INFINITY
  end

  xml do
    root "DocParts", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_element :docPart, to: :doc_part
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_parts)
  end
end

CTDocParts.register_class_with_id
