# frozen_string_literal: true

module Omml
  module Models
    class CTOfficeArtExtension < Base
      attribute :uri, :token

      xml do
        element "CT_OfficeArtExtension"

        namespace Omml::Namespace

        map_attribute :uri, to: :uri
      end
    end
  end
end
