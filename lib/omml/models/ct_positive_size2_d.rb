# frozen_string_literal: true

module Omml
  module Models
    class CTPositiveSize2D < Lutaml::Model::Serializable
      attribute :cx, :st_positive_coordinate
      attribute :cy, :st_positive_coordinate

      xml do
        element "CT_PositiveSize2D"

        namespace Omml::Namespace

        map_attribute :cx, to: :cx
        map_attribute :cy, to: :cy
      end
    end

    Omml::Configuration.register_model(CTPositiveSize2D)
  end
end
