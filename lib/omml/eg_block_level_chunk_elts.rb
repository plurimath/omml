# frozen_string_literal: true

require_relative "eg_content_block_content"
class EGBlockLevelChunkElts < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    import_model_attributes :eg_content_block_content
  end

  xml do
    no_root
    import_model_mappings :eg_content_block_content
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_block_level_chunk_elts)
  end
end

EGBlockLevelChunkElts.register_class_with_id
