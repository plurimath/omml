# frozen_string_literal: true

module Omml
  module Models
    class CTSignedHpsMeasure < Lutaml::Model::Serializable
      attribute :val, :st_signed_hps_measure

      xml do
        element "CT_SignedHpsMeasure"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTSignedHpsMeasure)
  end
end
