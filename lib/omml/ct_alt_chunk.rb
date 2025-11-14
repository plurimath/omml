# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_alt_chunk_pr"
require_relative "st_relationship_id"
class CTAltChunk < Lutaml::Model::Serializable
  attribute :alt_chunk_pr, :ct_alt_chunk_pr, collection: 0..1
  attribute :id, :st_relationship_id

  xml do
    root "AltChunk"

    sequence do
      map_element :altChunkPr, to: :alt_chunk_pr
    end
    map_attribute :id, to: :id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_alt_chunk)
  end
end

CTAltChunk.register_class_with_id
