# frozen_string_literal: true

module Omml
  module Models
    class CTLimLoc < Lutaml::Model::Serializable
      attribute :val, :st_lim_loc

      xml do
        element "CT_LimLoc"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTLimLoc)
  end
end
