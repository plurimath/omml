# frozen_string_literal: true

module Omml
  module Models
    class CTShp < Lutaml::Model::Serializable
      attribute :val, :st_shp

      xml do
        element "CT_Shp"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTShp)
  end
end
