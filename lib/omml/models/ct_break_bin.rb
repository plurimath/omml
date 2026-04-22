# frozen_string_literal: true

module Omml
  module Models
    class CTBreakBin < Lutaml::Model::Serializable
      attribute :val, :st_break_bin

      xml do
        element "CT_BreakBin"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTBreakBin)
  end
end
