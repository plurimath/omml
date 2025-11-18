# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
class CTPlaceholder < Lutaml::Model::Serializable
  attribute :doc_part, :ct_string

  xml do
    root "Placeholder"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :docPart, to: :doc_part
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_placeholder)
  end
end

CTPlaceholder.register_class_with_id
