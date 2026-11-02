# frozen_string_literal: true

module Omml
  module Models
    class CTHpsMeasure < Base
      attribute :val, :st_hps_measure

      xml do
        element "CT_HpsMeasure"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
