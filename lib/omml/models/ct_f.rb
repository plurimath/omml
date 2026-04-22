# frozen_string_literal: true

module Omml
  module Models
    class CTF < Lutaml::Model::Serializable
      attribute :f_pr, :ct_f_pr, collection: 0..1
      attribute :num, :ct_o_math_arg
      attribute :den, :ct_o_math_arg

      xml do
        element "CT_F"

        namespace Omml::Namespace

        sequence do
          map_element :fPr, to: :f_pr
          map_element :num, to: :num, render_empty: true
          map_element :den, to: :den, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTF)
  end
end
