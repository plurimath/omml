# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_twips_measure"
require_relative "ct_color"
require_relative "ct_on_off"
class CTFramesetSplitbar < Lutaml::Model::Serializable
  attribute :w, :ct_twips_measure, collection: 0..1
  attribute :color, :ct_color, collection: 0..1
  attribute :no_border, :ct_on_off, collection: 0..1
  attribute :flat_borders, :ct_on_off, collection: 0..1

  xml do
    root "FramesetSplitbar"

    sequence do
      map_element :w, to: :w
      map_element :color, to: :color
      map_element :noBorder, to: :no_border
      map_element :flatBorders, to: :flat_borders
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_frameset_splitbar)
  end
end

CTFramesetSplitbar.register_class_with_id
