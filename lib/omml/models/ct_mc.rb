# frozen_string_literal: true

module Omml
  module Models
    class CTMC < Lutaml::Model::Serializable
      attribute :mc_pr, :ct_mc_pr, collection: 0..1

      xml do
        element "CT_MC"

        namespace Omml::Namespace

        sequence do
          map_element :mcPr, to: :mc_pr
        end
      end
    end

    Omml::Configuration.register_model(CTMC)
  end
end
