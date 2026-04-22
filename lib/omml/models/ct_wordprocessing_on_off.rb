# frozen_string_literal: true

module Omml
  module Models
    class CTWordprocessingOnOff < Lutaml::Model::Serializable
      attribute :val, :st_on_off, default: -> { "on" }

      xml do
        element "CT_OnOff"

        namespace Omml::WordprocessingNamespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTWordprocessingOnOff)
  end
end
