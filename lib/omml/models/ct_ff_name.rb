# frozen_string_literal: true

module Omml
  module Models
    class CTFFName < Lutaml::Model::Serializable
      attribute :val, :st_ff_name

      xml do
        element "CT_FFName"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTFFName)
  end
end
