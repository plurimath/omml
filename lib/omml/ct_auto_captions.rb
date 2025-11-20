# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_auto_caption"
class CTAutoCaptions < Lutaml::Model::Serializable
  attribute :auto_caption, :ct_auto_caption, collection: 1..Float::INFINITY

  xml do
    root "AutoCaptions", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

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
