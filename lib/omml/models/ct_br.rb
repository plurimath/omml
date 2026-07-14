# frozen_string_literal: true

module Omml
  module Models
    class CTBr < Base
      attribute :type, :st_br_type
      attribute :clear, :st_br_clear

      xml do
        element "CT_Br"

        namespace Omml::Namespace

        map_attribute :type, to: :type
        map_attribute :clear, to: :clear
      end
    end
  end
end
