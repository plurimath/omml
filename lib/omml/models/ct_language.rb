# frozen_string_literal: true

module Omml
  module Models
    class CTLanguage < Base
      attribute :val, :st_lang
      attribute :east_asia, :st_lang
      attribute :bidi, :st_lang

      xml do
        element "CT_Language"

        namespace Omml::Namespace

        map_attribute :val, to: :val
        map_attribute :eastAsia, to: :east_asia
        map_attribute :bidi, to: :bidi
      end
    end
  end
end
