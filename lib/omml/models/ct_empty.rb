# frozen_string_literal: true

module Omml
  module Models
    class CTEmpty < Lutaml::Model::Serializable
      xml do
        element "CT_Empty"

        namespace Omml::Namespace
      end
    end

    Omml::Configuration.register_model(CTEmpty)
  end
end
