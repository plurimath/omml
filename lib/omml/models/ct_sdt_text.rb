# frozen_string_literal: true

module Omml
  module Models
    class CTSdtText < Base
      attribute :multi_line, :st_on_off

      xml do
        element "CT_SdtText"

        namespace Omml::Namespace

        map_attribute :multiLine, to: :multi_line
      end
    end
  end
end
