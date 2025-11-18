# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_doc_part_gallery"
class CTDocPartCategory < Lutaml::Model::Serializable
  attribute :name, :ct_string, collection: 1..1
  attribute :gallery, :ct_doc_part_gallery, collection: 1..1

  xml do
    root "DocPartCategory"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :name, to: :name
      map_element :gallery, to: :gallery
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_part_category)
  end
end

CTDocPartCategory.register_class_with_id
