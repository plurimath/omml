# frozen_string_literal: true

module Omml
  module Models
    class CTM < Lutaml::Model::Serializable
      attribute :m_pr, :ct_m_pr, collection: 0..1
      attribute :mr, :ct_mr, collection: 1..Float::INFINITY

      xml do
        element "CT_M"

        namespace Omml::Namespace

        sequence do
          map_element :mPr, to: :m_pr
          map_element :mr, to: :mr, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTM)
  end
end
