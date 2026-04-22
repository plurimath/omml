# frozen_string_literal: true

module Omml
  module Models
    class CTFFTextType < Lutaml::Model::Serializable
      attribute :val, :st_ff_text_type

      xml do
        element "CT_FFTextType"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTFFTextType)
  end
end
