# frozen_string_literal: true

module Omml
  module Models
    class CTSdtComboBox < Lutaml::Model::Serializable
      attribute :list_item, :ct_sdt_list_item, collection: 0..Float::INFINITY
      attribute :last_value, :st_string

      xml do
        element "CT_SdtComboBox"

        namespace Omml::Namespace

        sequence do
          map_element :listItem, to: :list_item
        end
        map_attribute :lastValue, to: :last_value
      end
    end

    Omml::Configuration.register_model(CTSdtComboBox)
  end
end
