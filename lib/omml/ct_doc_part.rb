# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_doc_part_pr"
require_relative "ct_body"
class CTDocPart < Lutaml::Model::Serializable
  attribute :doc_part_pr, :ct_doc_part_pr, collection: 0..1
  attribute :doc_part_body, :ct_body, collection: 0..1

  xml do
    root "DocPart"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :docPartPr, to: :doc_part_pr
      map_element :docPartBody, to: :doc_part_body
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_part)
  end
end

CTDocPart.register_class_with_id
