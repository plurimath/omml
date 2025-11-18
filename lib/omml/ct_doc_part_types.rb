# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_doc_part_type"
require_relative "st_on_off"
class CTDocPartTypes < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :type, :ct_doc_part_type, collection: 1..Float::INFINITY
  end
  attribute :all, :st_on_off

  xml do
    root "DocPartTypes"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_element :type, to: :type
    map_attribute :all, to: :all
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_part_types)
  end
end

CTDocPartTypes.register_class_with_id
