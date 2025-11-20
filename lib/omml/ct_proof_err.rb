# frozen_string_literal: true

require "lutaml/model"
require_relative "st_proof_err"
class CTProofErr < Lutaml::Model::Serializable
  attribute :type, :st_proof_err

  xml do
    root "ProofErr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :type, to: :type
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_proof_err)
  end
end

CTProofErr.register_class_with_id
