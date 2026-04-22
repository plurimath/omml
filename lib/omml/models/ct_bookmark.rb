# frozen_string_literal: true

module Omml
  module Models
    class CTBookmark < CTBookmarkRange
      attribute :name, :st_string

      xml do
        element "CT_Bookmark"

        namespace Omml::Namespace

        map_attribute :name, to: :name
      end
    end

    Omml::Configuration.register_model(CTBookmark)
  end
end
