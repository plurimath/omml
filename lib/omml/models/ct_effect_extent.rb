# frozen_string_literal: true

module Omml
  module Models
    class CTEffectExtent < Lutaml::Model::Serializable
      attribute :l, :st_coordinate
      attribute :t, :st_coordinate
      attribute :r, :st_coordinate
      attribute :b, :st_coordinate

      xml do
        element "CT_EffectExtent"

        namespace Omml::Namespace

        map_attribute :l, to: :l
        map_attribute :t, to: :t
        map_attribute :r, to: :r
        map_attribute :b, to: :b
      end
    end

    Omml::Configuration.register_model(CTEffectExtent)
  end
end
