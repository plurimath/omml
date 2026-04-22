# frozen_string_literal: true

module Omml
  module Models
    class CTTopBot < Lutaml::Model::Serializable
      attribute :val, :st_top_bot

      xml do
        element "CT_TopBot"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTTopBot)
  end
end
