# frozen_string_literal: true

module Omml
  module Models
    class CTSym < Lutaml::Model::Serializable
      attribute :font, :st_string
      attribute :char, :st_short_hex_number

      xml do
        element "CT_Sym"

        namespace Omml::Namespace

        map_attribute :font, to: :font
        map_attribute :char, to: :char
      end
    end

    Omml::Configuration.register_model(CTSym)
  end
end
