# frozen_string_literal: true

module Omml
  module Models
    class CTSignedHpsMeasure < Base
      attribute :val, :st_signed_hps_measure

      xml do
        element "CT_SignedHpsMeasure"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
