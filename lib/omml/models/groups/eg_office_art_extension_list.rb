# frozen_string_literal: true

module Omml
  module Models
    class EGOfficeArtExtensionList < Lutaml::Model::Serializable
      attribute :ext, :ct_office_art_extension, collection: 0..Float::INFINITY

      xml do
        type_name "EG_OfficeArtExtensionList"
        map_element :ext, to: :ext
      end
    end

    Omml::Configuration.register_model(EGOfficeArtExtensionList)
  end
end
