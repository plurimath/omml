# frozen_string_literal: true

module Omml
  module Models
    class CTSpacingRule < Base
      attribute :val, :st_spacing_rule

      xml do
        element "CT_SpacingRule"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
