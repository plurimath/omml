# frozen_string_literal: true

module Omml
  module Models
    class CTTwipsMeasure < Base
      attribute :val, :st_twips_measure

      xml do
        element "CT_TwipsMeasure"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
