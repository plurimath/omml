# frozen_string_literal: true

module Omml
  module Models
    class CTOnOff < Base
      attribute :val, :st_on_off, default: -> { "on" }

      xml do
        element "CT_OnOff"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
