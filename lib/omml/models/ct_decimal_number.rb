# frozen_string_literal: true

module Omml
  module Models
    class CTDecimalNumber < Base
      attribute :val, :st_decimal_number

      xml do
        element "CT_DecimalNumber"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
