# frozen_string_literal: true

module Omml
  module Models
    class CTNary < Lutaml::Model::Serializable
      attribute :nary_pr, :ct_nary_pr, collection: 0..1
      attribute :sub, :ct_o_math_arg
      attribute :sup, :ct_o_math_arg
      attribute :e, :ct_o_math_arg

      xml do
        element "CT_Nary"

        namespace Omml::Namespace

        sequence do
          map_element :naryPr, to: :nary_pr
          map_element :sub, to: :sub, render_empty: true
          map_element :sup, to: :sup, render_empty: true
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTNary)
  end
end
