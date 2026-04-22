# frozen_string_literal: true

module Omml
  module Models
    # Root element wrapper for the generated CTOMathPara content model.
    class OMathPara < Lutaml::Model::Serializable
      attribute :o_math_para_pr, :ct_o_math_para_pr, collection: 0..1
      attribute :o_math, :ct_o_math, collection: 1..Float::INFINITY
      attribute :r, :ct_r, collection: 0..Float::INFINITY

      xml do
        element "oMathPara"
        namespace Omml::Namespace
        ordered
        sequence do
          map_element :oMathParaPr, to: :o_math_para_pr
          map_element :oMath, to: :o_math, render_empty: true
          map_element :r, to: :r, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(OMathPara, id: :o_math_para)
  end
end
