# frozen_string_literal: true

module Omml
  module Models
    class CTEmpty < Base
      xml do
        element "CT_Empty"

        namespace Omml::Namespace
      end
    end
  end
end
