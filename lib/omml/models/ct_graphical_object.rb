# frozen_string_literal: true

module Omml
  module Models
    class CTGraphicalObject < Lutaml::Model::Serializable
      attribute :graphic_data, :ct_graphical_object_data

      xml do
        element "CT_GraphicalObject"

        namespace Omml::Namespace

        sequence do
          map_element :graphicData, to: :graphic_data, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTGraphicalObject)
  end
end
