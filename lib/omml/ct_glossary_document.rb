# frozen_string_literal: true

require_relative "ct_document_base"
require_relative "ct_doc_parts"
class CTGlossaryDocument < CTDocumentBase
  attribute :doc_parts, :ct_doc_parts, collection: 0..1

  xml do
    root "GlossaryDocument", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :docParts, to: :doc_parts
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_glossary_document)
  end
end

CTGlossaryDocument.register_class_with_id
