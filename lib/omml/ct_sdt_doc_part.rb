# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_on_off"
class CTSdtDocPart < Lutaml::Model::Serializable
  attribute :doc_part_gallery, :ct_string, collection: 0..1
  attribute :doc_part_category, :ct_string, collection: 0..1
  attribute :doc_part_unique, :ct_on_off, collection: 0..1

  xml do
    root "SdtDocPart"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :docPartGallery, to: :doc_part_gallery
      map_element :docPartCategory, to: :doc_part_category
      map_element :docPartUnique, to: :doc_part_unique
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_doc_part)
  end
end

CTSdtDocPart.register_class_with_id
