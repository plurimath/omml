# frozen_string_literal: true

module Omml
  module Models
    class CTBar < Lutaml::Model::Serializable
      attribute :bar_pr, :ct_bar_pr, collection: 0..1
      attribute :e, :ct_o_math_arg

      xml do
        element "CT_Bar"

        namespace Omml::Namespace

        sequence do
          map_element :barPr, to: :bar_pr
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTBar)
  end
end
