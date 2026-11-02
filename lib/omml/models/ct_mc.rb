# frozen_string_literal: true

module Omml
  module Models
    class CTMC < Base
      attribute :mc_pr, :ct_mc_pr, collection: 0..1

      xml do
        element "CT_MC"

        namespace Omml::Namespace

        sequence do
          map_element :mcPr, to: :mc_pr
        end
      end
    end
  end
end
