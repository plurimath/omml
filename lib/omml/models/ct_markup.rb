# frozen_string_literal: true

module Omml
  module Models
    class CTMarkup < Lutaml::Model::Serializable
      attribute :id, :st_decimal_number

      xml do
        element "CT_Markup"

        namespace Omml::Namespace

        map_attribute :id, to: :id
      end
    end

    Omml::Configuration.register_model(CTMarkup)
  end
end
