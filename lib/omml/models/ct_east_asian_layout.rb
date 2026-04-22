# frozen_string_literal: true

module Omml
  module Models
    class CTEastAsianLayout < Lutaml::Model::Serializable
      attribute :id, :st_decimal_number
      attribute :combine, :st_on_off
      attribute :combine_brackets, :st_combine_brackets
      attribute :vert, :st_on_off
      attribute :vert_compress, :st_on_off

      xml do
        element "CT_EastAsianLayout"

        namespace Omml::Namespace

        map_attribute :id, to: :id
        map_attribute :combine, to: :combine
        map_attribute :combineBrackets, to: :combine_brackets
        map_attribute :vert, to: :vert
        map_attribute :vertCompress, to: :vert_compress
      end
    end

    Omml::Configuration.register_model(CTEastAsianLayout)
  end
end
