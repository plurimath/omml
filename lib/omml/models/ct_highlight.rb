# frozen_string_literal: true

module Omml
  module Models
    class CTHighlight < Lutaml::Model::Serializable
      attribute :val, :st_highlight_color

      xml do
        element "CT_Highlight"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTHighlight)
  end
end
