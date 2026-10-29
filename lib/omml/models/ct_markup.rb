# frozen_string_literal: true

module Omml
  module Models
    class CTMarkup < Base
      attribute :id, :st_decimal_number

      xml do
        element "CT_Markup"

        namespace Omml::Namespace

        map_attribute :id, to: :id
      end
    end
  end
end
