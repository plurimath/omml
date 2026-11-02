# frozen_string_literal: true

module Omml
  module Models
    class CTPictureBase < Base
      xml do
        element "CT_PictureBase"

        namespace Omml::Namespace
      end
    end
  end
end
