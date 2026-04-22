# frozen_string_literal: true

module Omml
  module Models
    class CTControl < Lutaml::Model::Serializable
      attribute :name, :st_string
      attribute :shapeid, :st_string
      attribute :id, :st_relationship_id

      xml do
        element "CT_Control"

        namespace Omml::Namespace

        map_attribute :name, to: :name
        map_attribute :shapeid, to: :shapeid
        map_attribute :id, to: :id
      end
    end

    Omml::Configuration.register_model(CTControl)
  end
end
