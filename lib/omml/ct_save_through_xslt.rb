# frozen_string_literal: true

require "lutaml/model"
require_relative "st_relationship_id"
require_relative "st_string"
class CTSaveThroughXslt < Lutaml::Model::Serializable
  attribute :id, :st_relationship_id
  attribute :solution_id, :st_string

  xml do
    root "SaveThroughXslt", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :id, to: :id
    map_attribute :solutionID, to: :solution_id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_save_through_xslt)
  end
end

CTSaveThroughXslt.register_class_with_id
