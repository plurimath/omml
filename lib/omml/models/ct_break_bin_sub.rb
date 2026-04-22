# frozen_string_literal: true

module Omml
  module Models
    class CTBreakBinSub < Lutaml::Model::Serializable
      attribute :val, :st_break_bin_sub

      xml do
        element "CT_BreakBinSub"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTBreakBinSub)
  end
end
