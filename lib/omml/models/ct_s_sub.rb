# frozen_string_literal: true

module Omml
  module Models
    class CTSSub < Lutaml::Model::Serializable
      attribute :s_sub_pr, :ct_s_sub_pr, collection: 0..1
      attribute :e, :ct_o_math_arg
      attribute :sub, :ct_o_math_arg

      xml do
        element "CT_SSub"

        namespace Omml::Namespace

        sequence do
          map_element :sSubPr, to: :s_sub_pr
          map_element :e, to: :e, render_empty: true
          map_element :sub, to: :sub, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTSSub)
  end
end
