# frozen_string_literal: true

module Omml
  module Models
    class CTHyperlink < Lutaml::Model::Serializable
      import_model_attributes :eg_p_content
      attribute :tgt_frame, :st_string
      attribute :tooltip, :st_string
      attribute :doc_location, :st_string
      attribute :history, :st_on_off
      attribute :anchor, :st_string
      attribute :id, :st_relationship_id

      xml do
        element "CT_Hyperlink"

        namespace Omml::Namespace

        import_model_mappings :eg_p_content
        map_attribute :tgtFrame, to: :tgt_frame
        map_attribute :tooltip, to: :tooltip
        map_attribute :docLocation, to: :doc_location
        map_attribute :history, to: :history
        map_attribute :anchor, to: :anchor
        map_attribute :id, to: :id
      end
    end

    Omml::Configuration.register_model(CTHyperlink)
  end
end
