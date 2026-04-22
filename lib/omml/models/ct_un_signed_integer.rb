# frozen_string_literal: true

module Omml
  module Models
    class CTUnSignedInteger < Lutaml::Model::Serializable
      attribute :val, :st_un_signed_integer

      xml do
        element "CT_UnSignedInteger"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTUnSignedInteger)
  end
end
