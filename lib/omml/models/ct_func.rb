# frozen_string_literal: true

module Omml
  module Models
    class CTFunc < Lutaml::Model::Serializable
      attribute :func_pr, :ct_func_pr, collection: 0..1
      attribute :f_name, :ct_o_math_arg
      attribute :e, :ct_o_math_arg

      xml do
        element "CT_Func"

        namespace Omml::Namespace
        ordered

        sequence do
          map_element :funcPr, to: :func_pr
          map_element :fName, to: :f_name, render_empty: true
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTFunc)
  end
end
