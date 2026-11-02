# frozen_string_literal: true

module Omml
  module Models
    class CTSmartTagPr < Base
      attribute :attr, :ct_attr, collection: 0..Float::INFINITY

      xml do
        element "CT_SmartTagPr"

        namespace Omml::Namespace

        sequence do
          map_element :attr, to: :attr
        end
      end
    end
  end
end
