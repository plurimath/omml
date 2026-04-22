# frozen_string_literal: true

module Omml
  module Models
    class CTBorderBox < Lutaml::Model::Serializable
      attribute :border_box_pr, :ct_border_box_pr, collection: 0..1
      attribute :e, :ct_o_math_arg

      xml do
        element "CT_BorderBox"

        namespace Omml::Namespace
        ordered

        sequence do
          map_element :borderBoxPr, to: :border_box_pr
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTBorderBox)
  end
end
