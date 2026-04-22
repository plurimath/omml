# frozen_string_literal: true

module Omml
  module Models
    class CTPhant < Lutaml::Model::Serializable
      attribute :phant_pr, :ct_phant_pr, collection: 0..1
      attribute :e, :ct_o_math_arg

      xml do
        element "CT_Phant"

        namespace Omml::Namespace

        sequence do
          map_element :phantPr, to: :phant_pr
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTPhant)
  end
end
