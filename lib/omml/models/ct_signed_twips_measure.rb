# frozen_string_literal: true

module Omml
  module Models
    class CTSignedTwipsMeasure < Lutaml::Model::Serializable
      attribute :val, :st_signed_twips_measure

      xml do
        element "CT_SignedTwipsMeasure"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTSignedTwipsMeasure)
  end
end
