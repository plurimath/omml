# frozen_string_literal: true

module Omml
  module Models
    class CTWrapPath < Lutaml::Model::Serializable
      attribute :start, :ct_point2_d, collection: 1..1
      attribute :line_to, :ct_point2_d, collection: 2..Float::INFINITY
      attribute :edited, :boolean

      xml do
        element "CT_WrapPath"

        namespace Omml::Namespace

        sequence do
          map_element :start, to: :start, render_empty: true
          map_element :lineTo, to: :line_to, render_empty: true
        end
        map_attribute :edited, to: :edited
      end
    end

    Omml::Configuration.register_model(CTWrapPath)
  end
end
