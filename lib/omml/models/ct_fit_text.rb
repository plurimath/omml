# frozen_string_literal: true

module Omml
  module Models
    class CTFitText < Lutaml::Model::Serializable
      attribute :val, :st_twips_measure
      attribute :id, :st_decimal_number

      xml do
        element "CT_FitText"

        namespace Omml::Namespace

        map_attribute :val, to: :val
        map_attribute :id, to: :id
      end
    end

    Omml::Configuration.register_model(CTFitText)
  end
end
