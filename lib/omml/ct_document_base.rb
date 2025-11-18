# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_background"
class CTDocumentBase < Lutaml::Model::Serializable
  attribute :background, :ct_background, collection: 0..1

  xml do
    root "DocumentBase"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :background, to: :background
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_document_base)
  end
end

CTDocumentBase.register_class_with_id
