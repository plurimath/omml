# frozen_string_literal: true

module Omml
  module Models
    class EGOfficeArtExtensionList < Base
      attribute :ext, :ct_office_art_extension, collection: 0..Float::INFINITY

      xml do
        type_name "EG_OfficeArtExtensionList"
        map_element :ext, to: :ext
      end
    end
  end
end
