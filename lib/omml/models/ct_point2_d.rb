# frozen_string_literal: true

module Omml
  module Models
    class CTPoint2D < Lutaml::Model::Serializable
      attribute :x, :st_coordinate
      attribute :y, :st_coordinate

      xml do
        element "CT_Point2D"

        namespace Omml::Namespace

        map_attribute :x, to: :x
        map_attribute :y, to: :y
      end
    end

    Omml::Configuration.register_model(CTPoint2D)
  end
end
