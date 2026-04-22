# frozen_string_literal: true

module Omml
  module Models
    class CTOfficeArtExtension < Lutaml::Model::Serializable
      attribute :uri, :token

      xml do
        element "CT_OfficeArtExtension"

        namespace Omml::Namespace

        map_attribute :uri, to: :uri
      end
    end

    Omml::Configuration.register_model(CTOfficeArtExtension)
  end
end
