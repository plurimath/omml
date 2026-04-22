# frozen_string_literal: true

module Omml
  module Models
    class CTSPre < Lutaml::Model::Serializable
      attribute :s_pre_pr, :ct_s_pre_pr, collection: 0..1
      attribute :sub, :ct_o_math_arg
      attribute :sup, :ct_o_math_arg
      attribute :e, :ct_o_math_arg

      xml do
        element "CT_SPre"

        namespace Omml::Namespace
        ordered

        sequence do
          map_element :sPrePr, to: :s_pre_pr
          map_element :sub, to: :sub, render_empty: true
          map_element :sup, to: :sup, render_empty: true
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTSPre)
  end
end
