# frozen_string_literal: true

module Omml
  module Models
    class CTEm < Lutaml::Model::Serializable
      attribute :val, :st_em

      xml do
        element "CT_Em"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTEm)
  end
end
