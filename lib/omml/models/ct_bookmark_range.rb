# frozen_string_literal: true

module Omml
  module Models
    class CTBookmarkRange < CTMarkupRange
      attribute :col_first, :st_decimal_number
      attribute :col_last, :st_decimal_number

      xml do
        element "CT_BookmarkRange"

        namespace Omml::Namespace

        map_attribute :colFirst, to: :col_first
        map_attribute :colLast, to: :col_last
      end
    end

    Omml::Configuration.register_model(CTBookmarkRange)
  end
end
