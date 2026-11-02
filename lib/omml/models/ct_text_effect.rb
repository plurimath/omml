# frozen_string_literal: true

module Omml
  module Models
    class CTTextEffect < Base
      attribute :val, :st_text_effect

      xml do
        element "CT_TextEffect"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
