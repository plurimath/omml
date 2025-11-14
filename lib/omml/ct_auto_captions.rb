# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_auto_caption"
class CTAutoCaptions < Lutaml::Model::Serializable
  attribute :auto_caption, :ct_auto_caption, collection: 1..Float::INFINITY

  xml do
    root "AutoCaptions"

    sequence do
      map_element :autoCaption, to: :auto_caption
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_auto_captions)
  end
end

CTAutoCaptions.register_class_with_id
