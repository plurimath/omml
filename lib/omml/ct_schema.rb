# frozen_string_literal: true

require "lutaml/model"
class CTSchema < Lutaml::Model::Serializable
  attribute :uri, :string
  attribute :manifest_location, :string

  xml do
    root "Schema"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :uri, to: :uri
    map_attribute :manifestLocation, to: :manifest_location
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_schema)
  end
end

CTSchema.register_class_with_id
