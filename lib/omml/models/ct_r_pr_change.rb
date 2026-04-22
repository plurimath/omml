# frozen_string_literal: true

module Omml
  module Models
    class CTRPrChange < CTTrackChange
      attribute :r_pr, :ct_r_pr_original, collection: 1..1

      xml do
        element "CT_RPrChange"

        namespace Omml::WordprocessingNamespace

        sequence do
          map_element :rPr, to: :r_pr, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTRPrChange)
  end
end
