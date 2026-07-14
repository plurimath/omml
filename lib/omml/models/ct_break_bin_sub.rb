# frozen_string_literal: true

module Omml
  module Models
    class CTBreakBinSub < Base
      attribute :val, :st_break_bin_sub

      xml do
        element "CT_BreakBinSub"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
