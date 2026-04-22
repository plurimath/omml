# frozen_string_literal: true

module Omml
  module Models
    class CTDecimalNumber < Lutaml::Model::Serializable
      attribute :val, :st_decimal_number

      xml do
        element "CT_DecimalNumber"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTDecimalNumber)
  end
end
