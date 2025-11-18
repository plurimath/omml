# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_anchor"
require_relative "ct_inline"
class CTDrawing < Lutaml::Model::Serializable
  choice(min: 1, max: Float::INFINITY) do
    attribute :anchor, :ct_anchor, collection: 0..1
    attribute :inline, :ct_inline, collection: 0..1
  end

  xml do
    root "Drawing"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_element :anchor, to: :anchor
    map_element :inline, to: :inline
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_drawing)
  end
end

CTDrawing.register_class_with_id
