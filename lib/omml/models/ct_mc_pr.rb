# frozen_string_literal: true

module Omml
  module Models
    class CTMCPr < Base
      attribute :count, :ct_integer255, collection: 0..1
      attribute :mc_jc, :ct_x_align, collection: 0..1

      xml do
        element "CT_MCPr"

        namespace Omml::Namespace

        sequence do
          map_element :count, to: :count
          map_element :mcJc, to: :mc_jc
        end
      end
    end
  end
end
