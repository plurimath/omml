# frozen_string_literal: true

module Omml
  module Models
    class CTLang < Lutaml::Model::Serializable
      attribute :val, :st_lang

      xml do
        element "CT_Lang"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTLang)
  end
end
