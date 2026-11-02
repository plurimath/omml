# frozen_string_literal: true

module Omml
  module Models
    class CTString < Base
      attribute :val, :st_string

      xml do
        element "CT_String"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
