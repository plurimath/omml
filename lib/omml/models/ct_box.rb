# frozen_string_literal: true

module Omml
  module Models
    class CTBox < Lutaml::Model::Serializable
      attribute :box_pr, :ct_box_pr, collection: 0..1
      attribute :e, :ct_o_math_arg

      xml do
        element "CT_Box"

        namespace Omml::Namespace

        sequence do
          map_element :boxPr, to: :box_pr
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTBox)
  end
end
