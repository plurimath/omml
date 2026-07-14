# frozen_string_literal: true

module Omml
  module Models
    class CTInteger2 < Base
      attribute :val, :st_integer2

      xml do
        element "CT_Integer2"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
