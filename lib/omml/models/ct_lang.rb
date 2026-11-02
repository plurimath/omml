# frozen_string_literal: true

module Omml
  module Models
    class CTLang < Base
      attribute :val, :st_lang

      xml do
        element "CT_Lang"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
