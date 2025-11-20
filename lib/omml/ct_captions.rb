# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_caption"
require_relative "ct_auto_captions"
class CTCaptions < Lutaml::Model::Serializable
  attribute :caption, :ct_caption, collection: 1..Float::INFINITY
  attribute :auto_captions, :ct_auto_captions, collection: 0..1

  xml do
    root "Captions", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :caption, to: :caption
      map_element :autoCaptions, to: :auto_captions
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_captions)
  end
end

CTCaptions.register_class_with_id
