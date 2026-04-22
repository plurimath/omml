# frozen_string_literal: true

module Omml
  module Models
    class CTGraphicalObjectData < Lutaml::Model::Serializable
      attribute :uri, :token

      xml do
        element "CT_GraphicalObjectData"

        namespace Omml::Namespace

        map_attribute :uri, to: :uri
      end
    end

    Omml::Configuration.register_model(CTGraphicalObjectData)
  end
end
