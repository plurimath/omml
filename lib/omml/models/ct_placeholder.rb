# frozen_string_literal: true

module Omml
  module Models
    class CTPlaceholder < Lutaml::Model::Serializable
      attribute :doc_part, :ct_string

      xml do
        element "CT_Placeholder"

        namespace Omml::Namespace

        sequence do
          map_element :docPart, to: :doc_part, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTPlaceholder)
  end
end
