# frozen_string_literal: true

module Omml
  module Models
    class CTLock < Lutaml::Model::Serializable
      attribute :val, :st_lock

      xml do
        element "CT_Lock"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTLock)
  end
end
