# frozen_string_literal: true

module Omml
  module Models
    class CTMCS < Lutaml::Model::Serializable
      attribute :mc, :ct_mc, collection: 1..Float::INFINITY

      xml do
        element "CT_MCS"

        namespace Omml::Namespace

        sequence do
          map_element :mc, to: :mc, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTMCS)
  end
end
