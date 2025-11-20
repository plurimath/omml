# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_frameset_splitbar"
require_relative "ct_frame_layout"
require_relative "ct_frameset"
require_relative "ct_frame"
class CTFrameset < Lutaml::Model::Serializable
  attribute :sz, :ct_string, collection: 0..1
  attribute :frameset_splitbar, :ct_frameset_splitbar, collection: 0..1
  attribute :frame_layout, :ct_frame_layout, collection: 0..1
  choice(min: 0, max: Float::INFINITY) do
    attribute :frameset, :ct_frameset, collection: 0..Float::INFINITY
    attribute :frame, :ct_frame, collection: 0..Float::INFINITY
  end

  xml do
    root "Frameset", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :sz, to: :sz
      map_element :framesetSplitbar, to: :frameset_splitbar
      map_element :frameLayout, to: :frame_layout
      map_element :frameset, to: :frameset
      map_element :frame, to: :frame
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_frameset)
  end
end

CTFrameset.register_class_with_id
