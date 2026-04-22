# frozen_string_literal: true

module Omml
  module Models
    class CTOMathJc < Lutaml::Model::Serializable
      attribute :val, :st_jc

      xml do
        element "CT_OMathJc"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTOMathJc)
  end
end
