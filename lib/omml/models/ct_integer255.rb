# frozen_string_literal: true

module Omml
  module Models
    class CTInteger255 < Lutaml::Model::Serializable
      attribute :val, :st_integer255

      xml do
        element "CT_Integer255"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTInteger255)
  end
end
