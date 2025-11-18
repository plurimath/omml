# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_doc_part_behavior"
class CTDocPartBehaviors < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :behavior, :ct_doc_part_behavior, collection: 1..Float::INFINITY
  end

  xml do
    root "DocPartBehaviors"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_element :behavior, to: :behavior
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_part_behaviors)
  end
end

CTDocPartBehaviors.register_class_with_id
