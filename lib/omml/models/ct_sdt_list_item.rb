# frozen_string_literal: true

module Omml
  module Models
    class CTSdtListItem < Base
      attribute :display_text, :st_string
      attribute :value, :st_string

      xml do
        element "CT_SdtListItem"

        namespace Omml::Namespace

        map_attribute :displayText, to: :display_text
        map_attribute :value, to: :value
      end
    end
  end
end
