# frozen_string_literal: true

module Omml
  module Models
    class CTVerticalAlignRun < Base
      attribute :val, :st_vertical_align_run

      xml do
        element "CT_VerticalAlignRun"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
