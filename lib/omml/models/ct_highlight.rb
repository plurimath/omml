# frozen_string_literal: true

module Omml
  module Models
    class CTHighlight < Base
      attribute :val, :st_highlight_color

      xml do
        element "CT_Highlight"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
