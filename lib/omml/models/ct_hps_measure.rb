# frozen_string_literal: true

module Omml
  module Models
    class CTHpsMeasure < Lutaml::Model::Serializable
      attribute :val, :st_hps_measure

      xml do
        element "CT_HpsMeasure"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTHpsMeasure)
  end
end
