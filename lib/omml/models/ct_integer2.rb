# frozen_string_literal: true

module Omml
  module Models
    class CTInteger2 < Lutaml::Model::Serializable
      attribute :val, :st_integer2

      xml do
        element "CT_Integer2"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTInteger2)
  end
end
