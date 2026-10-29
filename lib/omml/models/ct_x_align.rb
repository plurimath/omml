# frozen_string_literal: true

module Omml
  module Models
    class CTXAlign < Base
      attribute :val, :st_x_align

      xml do
        element "CT_XAlign"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
