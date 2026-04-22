# frozen_string_literal: true

module Omml
  module Models
    class CTLimLow < Lutaml::Model::Serializable
      attribute :lim_low_pr, :ct_lim_low_pr, collection: 0..1
      attribute :e, :ct_o_math_arg
      attribute :lim, :ct_o_math_arg

      xml do
        element "CT_LimLow"

        namespace Omml::Namespace
        ordered

        sequence do
          map_element :limLowPr, to: :lim_low_pr
          map_element :e, to: :e, render_empty: true
          map_element :lim, to: :lim, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTLimLow)
  end
end
