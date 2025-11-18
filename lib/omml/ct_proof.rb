# frozen_string_literal: true

require "lutaml/model"
require_relative "st_proof"
class CTProof < Lutaml::Model::Serializable
  attribute :spelling, :st_proof
  attribute :grammar, :st_proof

  xml do
    root "Proof"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :spelling, to: :spelling
    map_attribute :grammar, to: :grammar
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_proof)
  end
end

CTProof.register_class_with_id
