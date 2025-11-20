# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_effect_extent"
require_relative "st_wrap_text"
require_relative "st_wrap_distance"
class CTWrapSquare < Lutaml::Model::Serializable
  attribute :effect_extent, :ct_effect_extent, collection: 0..1
  attribute :wrap_text, :st_wrap_text
  attribute :dist_t, :st_wrap_distance
  attribute :dist_b, :st_wrap_distance
  attribute :dist_l, :st_wrap_distance
  attribute :dist_r, :st_wrap_distance

  xml do
    root "WrapSquare", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :effectExtent, to: :effect_extent
    end
    map_attribute :wrapText, to: :wrap_text
    map_attribute :distT, to: :dist_t
    map_attribute :distB, to: :dist_b
    map_attribute :distL, to: :dist_l
    map_attribute :distR, to: :dist_r
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_wrap_square)
  end
end

CTWrapSquare.register_class_with_id
