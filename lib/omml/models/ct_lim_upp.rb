# frozen_string_literal: true

module Omml
  module Models
    class CTLimUpp < Lutaml::Model::Serializable
      attribute :lim_upp_pr, :ct_lim_upp_pr, collection: 0..1
      attribute :e, :ct_o_math_arg
      attribute :lim, :ct_o_math_arg

      xml do
        element "CT_LimUpp"

        namespace Omml::Namespace

        sequence do
          map_element :limUppPr, to: :lim_upp_pr
          map_element :e, to: :e, render_empty: true
          map_element :lim, to: :lim, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTLimUpp)
  end
end
