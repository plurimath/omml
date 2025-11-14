# frozen_string_literal: true

require_relative "eg_block_level_chunk_elts"
require_relative "ct_alt_chunk"
class EGBlockLevelElts < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    import_model_attributes :eg_block_level_chunk_elts
    attribute :alt_chunk, :ct_alt_chunk, collection: 0..Float::INFINITY
  end

  xml do
    no_root
    import_model_mappings :eg_block_level_chunk_elts
    map_element :altChunk, to: :alt_chunk
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_block_level_elts)
  end
end

EGBlockLevelElts.register_class_with_id
