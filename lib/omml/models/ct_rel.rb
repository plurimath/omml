# frozen_string_literal: true

module Omml
  module Models
    class CTRel < Lutaml::Model::Serializable
      attribute :id, :st_relationship_id

      xml do
        element "CT_Rel"

        namespace Omml::Namespace

        map_attribute :id, to: :id
      end
    end

    Omml::Configuration.register_model(CTRel)
  end
end
