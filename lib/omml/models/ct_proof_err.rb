# frozen_string_literal: true

module Omml
  module Models
    class CTProofErr < Base
      attribute :type, :st_proof_err

      xml do
        element "CT_ProofErr"

        namespace Omml::Namespace

        map_attribute :type, to: :type
      end
    end
  end
end
