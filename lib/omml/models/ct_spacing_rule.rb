# frozen_string_literal: true

module Omml
  module Models
    class CTSpacingRule < Lutaml::Model::Serializable
      attribute :val, :st_spacing_rule

      xml do
        element "CT_SpacingRule"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTSpacingRule)
  end
end
