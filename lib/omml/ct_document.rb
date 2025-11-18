# frozen_string_literal: true

require_relative "ct_document_base"
require_relative "ct_body"
class CTDocument < CTDocumentBase
  attribute :body, :ct_body, collection: 0..1

  xml do
    root "Document"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :body, to: :body
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_document)
  end
end

CTDocument.register_class_with_id
