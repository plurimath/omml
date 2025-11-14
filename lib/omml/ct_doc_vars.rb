# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_doc_var"
class CTDocVars < Lutaml::Model::Serializable
  attribute :doc_var, :ct_doc_var, collection: 0..Float::INFINITY

  xml do
    root "DocVars"

    sequence do
      map_element :docVar, to: :doc_var
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_vars)
  end
end

CTDocVars.register_class_with_id
