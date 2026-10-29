# frozen_string_literal: true

module Omml
  module Models
    class CTInteger255 < Base
      attribute :val, :st_integer255

      xml do
        element "CT_Integer255"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
