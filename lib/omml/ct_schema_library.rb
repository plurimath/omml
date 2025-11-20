# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_schema"
class CTSchemaLibrary < Lutaml::Model::Serializable
  attribute :schema, :ct_schema, collection: 0..Float::INFINITY

  xml do
    root "SchemaLibrary", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :schema, to: :schema
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_schema_library)
  end
end

CTSchemaLibrary.register_class_with_id
