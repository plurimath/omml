# frozen_string_literal: true

module Omml
  module Models
    class CTLimLoc < Base
      attribute :val, :st_lim_loc

      xml do
        element "CT_LimLoc"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
