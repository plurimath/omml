# frozen_string_literal: true

module Omml
  module Models
    class CTFFTextInput < Lutaml::Model::Serializable
      attribute :type, :ct_ff_text_type, collection: 0..1
      attribute :default, :ct_string, collection: 0..1
      attribute :max_length, :ct_decimal_number, collection: 0..1
      attribute :format, :ct_string, collection: 0..1

      xml do
        element "CT_FFTextInput"

        namespace Omml::Namespace

        sequence do
          map_element :type, to: :type
          map_element :default, to: :default
          map_element :maxLength, to: :max_length
          map_element :format, to: :format
        end
      end
    end

    Omml::Configuration.register_model(CTFFTextInput)
  end
end
