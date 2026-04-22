# frozen_string_literal: true

module Omml
  module Models
    class CTSSubSup < Lutaml::Model::Serializable
      attribute :s_sub_sup_pr, :ct_s_sub_sup_pr, collection: 0..1
      attribute :e, :ct_o_math_arg
      attribute :sub, :ct_o_math_arg
      attribute :sup, :ct_o_math_arg

      xml do
        element "CT_SSubSup"

        namespace Omml::Namespace
        ordered

        sequence do
          map_element :sSubSupPr, to: :s_sub_sup_pr
          map_element :e, to: :e, render_empty: true
          map_element :sub, to: :sub, render_empty: true
          map_element :sup, to: :sup, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTSSubSup)
  end
end
