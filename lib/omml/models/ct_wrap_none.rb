# frozen_string_literal: true

module Omml
  module Models
    class CTWrapNone < Lutaml::Model::Serializable
      xml do
        element "CT_WrapNone"

        namespace Omml::Namespace
      end
    end

    Omml::Configuration.register_model(CTWrapNone)
  end
end
