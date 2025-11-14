# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_font"
class CTFontsList < Lutaml::Model::Serializable
  attribute :font, :ct_font, collection: 0..Float::INFINITY

  xml do
    root "FontsList"

    sequence do
      map_element :font, to: :font
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_fonts_list)
  end
end

CTFontsList.register_class_with_id
