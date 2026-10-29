# frozen_string_literal: true

module Omml
  module Models
    class CTFtnEdnRef < Base
      attribute :custom_mark_follows, :st_on_off
      attribute :id, :st_decimal_number

      xml do
        element "CT_FtnEdnRef"

        namespace Omml::Namespace

        map_attribute :customMarkFollows, to: :custom_mark_follows
        map_attribute :id, to: :id
      end
    end
  end
end
