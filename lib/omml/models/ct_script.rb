# frozen_string_literal: true

module Omml
  module Models
    class CTScript < Base
      attribute :val, :st_script

      xml do
        element "CT_Script"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
