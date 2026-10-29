# frozen_string_literal: true

module Omml
  module Models
    class CTFitText < Base
      attribute :val, :st_twips_measure
      attribute :id, :st_decimal_number

      xml do
        element "CT_FitText"

        namespace Omml::Namespace

        map_attribute :val, to: :val
        map_attribute :id, to: :id
      end
    end
  end
end
