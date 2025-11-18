# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_p_content"
require_relative "st_string"
require_relative "st_on_off"
require_relative "st_relationship_id"
class CTHyperlink < Lutaml::Model::Serializable
  import_model_attributes :eg_p_content
  attribute :tgt_frame, :st_string
  attribute :tooltip, :st_string
  attribute :doc_location, :st_string
  attribute :history, :st_on_off
  attribute :anchor, :st_string
  attribute :id, :st_relationship_id

  xml do
    root "Hyperlink"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    import_model_mappings :eg_p_content
    map_attribute :tgtFrame, to: :tgt_frame
    map_attribute :tooltip, to: :tooltip
    map_attribute :docLocation, to: :doc_location
    map_attribute :history, to: :history
    map_attribute :anchor, to: :anchor
    map_attribute :id, to: :id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_hyperlink)
  end
end

CTHyperlink.register_class_with_id
