# frozen_string_literal: true

module Omml
  module Models
    class CTLock < Base
      attribute :val, :st_lock

      xml do
        element "CT_Lock"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
