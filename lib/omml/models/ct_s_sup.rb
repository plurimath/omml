# frozen_string_literal: true

module Omml
  module Models
    class CTSSup < Lutaml::Model::Serializable
      attribute :s_sup_pr, :ct_s_sup_pr, collection: 0..1
      attribute :e, :ct_o_math_arg
      attribute :sup, :ct_o_math_arg

      xml do
        element "CT_SSup"

        namespace Omml::Namespace

        sequence do
          map_element :sSupPr, to: :s_sup_pr
          map_element :e, to: :e, render_empty: true
          map_element :sup, to: :sup, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTSSup)
  end
end
