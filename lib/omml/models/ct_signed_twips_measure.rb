# frozen_string_literal: true

module Omml
  module Models
    class CTSignedTwipsMeasure < Base
      attribute :val, :st_signed_twips_measure

      xml do
        element "CT_SignedTwipsMeasure"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
