# frozen_string_literal: true

module Omml
  module Models
    class CTProofErr < Lutaml::Model::Serializable
      attribute :type, :st_proof_err

      xml do
        element "CT_ProofErr"

        namespace Omml::Namespace

        map_attribute :type, to: :type
      end
    end

    Omml::Configuration.register_model(CTProofErr)
  end
end
