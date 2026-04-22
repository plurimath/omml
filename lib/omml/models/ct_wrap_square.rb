# frozen_string_literal: true

module Omml
  module Models
    class CTWrapSquare < Lutaml::Model::Serializable
      attribute :effect_extent, :ct_effect_extent, collection: 0..1
      attribute :wrap_text, :st_wrap_text
      attribute :dist_t, :st_wrap_distance
      attribute :dist_b, :st_wrap_distance
      attribute :dist_l, :st_wrap_distance
      attribute :dist_r, :st_wrap_distance

      xml do
        element "CT_WrapSquare"

        namespace Omml::Namespace

        sequence do
          map_element :effectExtent, to: :effect_extent
        end
        map_attribute :wrapText, to: :wrap_text
        map_attribute :distT, to: :dist_t
        map_attribute :distB, to: :dist_b
        map_attribute :distL, to: :dist_l
        map_attribute :distR, to: :dist_r
      end
    end

    Omml::Configuration.register_model(CTWrapSquare)
  end
end
