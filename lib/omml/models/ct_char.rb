# frozen_string_literal: true

module Omml
  module Models
    class CTChar < Base
      attribute :val, :st_char

      xml do
        element "CT_Char"

        namespace Omml::Namespace

        map_attribute :val, to: :val, render_empty: true
      end
    end
  end
end
