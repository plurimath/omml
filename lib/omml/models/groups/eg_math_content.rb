# frozen_string_literal: true

module Omml
  module Models
    class EGMathContent < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        attribute :o_math_para, :ct_o_math_para
        attribute :o_math, :ct_o_math
      end

      xml do
        type_name "EG_MathContent"
        map_element :oMathPara, to: :o_math_para, render_empty: true
        map_element :oMath, to: :o_math, render_empty: true
      end
    end

    Omml::Configuration.register_model(EGMathContent)
  end
end
