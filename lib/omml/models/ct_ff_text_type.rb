# frozen_string_literal: true

module Omml
  module Models
    class CTFFTextType < Base
      attribute :val, :st_ff_text_type

      xml do
        element "CT_FFTextType"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
