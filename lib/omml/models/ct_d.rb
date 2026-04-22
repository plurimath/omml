# frozen_string_literal: true

module Omml
  module Models
    class CTD < Lutaml::Model::Serializable
      attribute :d_pr, :ct_d_pr, collection: 0..1
      attribute :e, :ct_o_math_arg, collection: 1..Float::INFINITY

      xml do
        element "CT_D"

        namespace Omml::Namespace

        sequence do
          map_element :dPr, to: :d_pr
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTD)
  end
end
