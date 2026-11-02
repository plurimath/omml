# frozen_string_literal: true

module Omml
  module Models
    class CTYAlign < Base
      attribute :val, :st_y_align

      xml do
        element "CT_YAlign"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
