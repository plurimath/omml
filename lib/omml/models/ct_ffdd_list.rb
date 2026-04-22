# frozen_string_literal: true

module Omml
  module Models
    class CTFFDDList < Lutaml::Model::Serializable
      attribute :result, :ct_decimal_number, collection: 0..1
      attribute :default, :ct_decimal_number, collection: 0..1
      attribute :list_entry, :ct_string, collection: 0..Float::INFINITY

      xml do
        element "CT_FFDDList"

        namespace Omml::Namespace

        sequence do
          map_element :result, to: :result
          map_element :default, to: :default
          map_element :listEntry, to: :list_entry
        end
      end
    end

    Omml::Configuration.register_model(CTFFDDList)
  end
end
