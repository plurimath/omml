# frozen_string_literal: true

module Omml
  module Models
    class CTWrapTopBottom < Lutaml::Model::Serializable
      attribute :effect_extent, :ct_effect_extent, collection: 0..1
      attribute :dist_t, :st_wrap_distance
      attribute :dist_b, :st_wrap_distance

      xml do
        element "CT_WrapTopBottom"

        namespace Omml::Namespace

        sequence do
          map_element :effectExtent, to: :effect_extent
        end
        map_attribute :distT, to: :dist_t
        map_attribute :distB, to: :dist_b
      end
    end

    Omml::Configuration.register_model(CTWrapTopBottom)
  end
end
