# frozen_string_literal: true

module Omml
  module Models
    class CTFFHelpText < Base
      attribute :type, :st_info_text_type
      attribute :val, :st_ff_help_text_val

      xml do
        element "CT_FFHelpText"

        namespace Omml::Namespace

        map_attribute :type, to: :type
        map_attribute :val, to: :val
      end
    end
  end
end
