# frozen_string_literal: true

module Omml
  module Models
    class CTPermStart < CTPerm
      attribute :ed_grp, :st_ed_grp
      attribute :ed, :st_string
      attribute :col_first, :st_decimal_number
      attribute :col_last, :st_decimal_number

      xml do
        element "CT_PermStart"

        namespace Omml::Namespace

        map_attribute :edGrp, to: :ed_grp
        map_attribute :ed, to: :ed
        map_attribute :colFirst, to: :col_first
        map_attribute :colLast, to: :col_last
      end
    end

    Omml::Configuration.register_model(CTPermStart)
  end
end
