# frozen_string_literal: true

require "lutaml/model"
require_relative "st_relationship_id"
class CTEmbeddedWAVAudioFile < Lutaml::Model::Serializable
  attribute :embed, :st_relationship_id
  attribute :name, :string
  attribute :built_in, :boolean

  xml do
    root "EmbeddedWAVAudioFile"

    map_attribute :embed, to: :embed
    map_attribute :name, to: :name
    map_attribute :builtIn, to: :built_in
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_embedded_wav_audio_file)
  end
end

CTEmbeddedWAVAudioFile.register_class_with_id
