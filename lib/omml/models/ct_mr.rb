# frozen_string_literal: true

module Omml
  module Models
    class CTMR < Lutaml::Model::Serializable
      attribute :e, :ct_o_math_arg, collection: 1..Float::INFINITY

      xml do
        element "CT_MR"

        namespace Omml::Namespace

        sequence do
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTMR)
  end
end
