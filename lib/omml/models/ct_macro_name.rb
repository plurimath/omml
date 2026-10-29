# frozen_string_literal: true

module Omml
  module Models
    class CTMacroName < Base
      attribute :val, :st_macro_name

      xml do
        element "CT_MacroName"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
