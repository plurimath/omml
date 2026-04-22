# frozen_string_literal: true

module Omml
  module Models
    class CTSdtDocPart < Lutaml::Model::Serializable
      attribute :doc_part_gallery, :ct_string, collection: 0..1
      attribute :doc_part_category, :ct_string, collection: 0..1
      attribute :doc_part_unique, :ct_on_off, collection: 0..1

      xml do
        element "CT_SdtDocPart"

        namespace Omml::Namespace

        sequence do
          map_element :docPartGallery, to: :doc_part_gallery
          map_element :docPartCategory, to: :doc_part_category
          map_element :docPartUnique, to: :doc_part_unique
        end
      end
    end

    Omml::Configuration.register_model(CTSdtDocPart)
  end
end
