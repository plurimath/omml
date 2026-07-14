# frozen_string_literal: true

module Omml
  module Models
    class CTGraphicalObjectData < Base
      attribute :uri, :token

      xml do
        element "CT_GraphicalObjectData"

        namespace Omml::Namespace

        map_attribute :uri, to: :uri
      end
    end
  end
end
