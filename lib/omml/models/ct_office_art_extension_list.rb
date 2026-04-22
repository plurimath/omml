# frozen_string_literal: true

module Omml
  module Models
    class CTOfficeArtExtensionList < Lutaml::Model::Serializable
      import_model_attributes :eg_office_art_extension_list

      xml do
        element "CT_OfficeArtExtensionList"

        namespace Omml::Namespace

        sequence do
          import_model_mappings :eg_office_art_extension_list
        end
      end
    end

    Omml::Configuration.register_model(CTOfficeArtExtensionList)
  end
end
