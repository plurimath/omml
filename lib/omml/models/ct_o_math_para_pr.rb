# frozen_string_literal: true

module Omml
  module Models
    class CTOMathParaPr < Lutaml::Model::Serializable
      attribute :jc, :ct_o_math_jc, collection: 0..1

      xml do
        element "CT_OMathParaPr"

        namespace Omml::Namespace

        sequence do
          map_element :jc, to: :jc
        end
      end
    end

    Omml::Configuration.register_model(CTOMathParaPr)
  end
end
