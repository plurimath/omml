# frozen_string_literal: true

module Omml
  module Models
    class CTEm < Base
      attribute :val, :st_em

      xml do
        element "CT_Em"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
