# frozen_string_literal: true

module Omml
  module Models
    class CTDataBinding < Lutaml::Model::Serializable
      attribute :prefix_mappings, :st_string
      attribute :xpath, :st_string
      attribute :store_item_id, :st_string

      xml do
        element "CT_DataBinding"

        namespace Omml::Namespace

        map_attribute :prefixMappings, to: :prefix_mappings
        map_attribute :xpath, to: :xpath
        map_attribute :storeItemID, to: :store_item_id
      end
    end

    Omml::Configuration.register_model(CTDataBinding)
  end
end
