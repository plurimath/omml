# frozen_string_literal: true

module Omml
  module Models
    class CTWrapTight < Lutaml::Model::Serializable
      attribute :wrap_polygon, :ct_wrap_path, collection: 1..1
      attribute :wrap_text, :st_wrap_text
      attribute :dist_l, :st_wrap_distance
      attribute :dist_r, :st_wrap_distance

      xml do
        element "CT_WrapTight"

        namespace Omml::Namespace

        sequence do
          map_element :wrapPolygon, to: :wrap_polygon, render_empty: true
        end
        map_attribute :wrapText, to: :wrap_text
        map_attribute :distL, to: :dist_l
        map_attribute :distR, to: :dist_r
      end
    end

    Omml::Configuration.register_model(CTWrapTight)
  end
end
