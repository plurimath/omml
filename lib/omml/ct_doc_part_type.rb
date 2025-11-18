# frozen_string_literal: true

require "lutaml/model"
require_relative "st_doc_part_type"
class CTDocPartType < Lutaml::Model::Serializable
  attribute :val, :st_doc_part_type

  xml do
    root "DocPartType"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_part_type)
  end
end

CTDocPartType.register_class_with_id
