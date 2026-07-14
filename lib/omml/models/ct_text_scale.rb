# frozen_string_literal: true

module Omml
  module Models
    class CTTextScale < Base
      attribute :val, :st_text_scale

      xml do
        element "CT_TextScale"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
