# frozen_string_literal: true

module Omml
  module Models
    class CTMoveBookmark < CTBookmark
      attribute :author, :st_string
      attribute :date, :st_date_time

      xml do
        element "CT_MoveBookmark"

        namespace Omml::Namespace

        map_attribute :author, to: :author
        map_attribute :date, to: :date
      end
    end

    Omml::Configuration.register_model(CTMoveBookmark)
  end
end
