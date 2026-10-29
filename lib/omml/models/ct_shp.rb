# frozen_string_literal: true

module Omml
  module Models
    class CTShp < Base
      attribute :val, :st_shp

      xml do
        element "CT_Shp"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
