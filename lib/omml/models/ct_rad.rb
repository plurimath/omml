# frozen_string_literal: true

module Omml
  module Models
    class CTRad < Lutaml::Model::Serializable
      attribute :rad_pr, :ct_rad_pr, collection: 0..1
      attribute :deg, :ct_o_math_arg
      attribute :e, :ct_o_math_arg

      xml do
        element "CT_Rad"

        namespace Omml::Namespace

        sequence do
          map_element :radPr, to: :rad_pr
          map_element :deg, to: :deg, render_empty: true
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTRad)
  end
end
