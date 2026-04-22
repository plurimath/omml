# frozen_string_literal: true

module Omml
  module Models
    class CTStyle < Lutaml::Model::Serializable
      attribute :val, :st_style

      xml do
        element "CT_Style"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTStyle)
  end
end
