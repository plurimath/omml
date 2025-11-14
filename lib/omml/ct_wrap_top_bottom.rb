# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_effect_extent"
require_relative "st_wrap_distance"
class CTWrapTopBottom < Lutaml::Model::Serializable
  attribute :effect_extent, :ct_effect_extent, collection: 0..1
  attribute :dist_t, :st_wrap_distance
  attribute :dist_b, :st_wrap_distance

  xml do
    root "WrapTopBottom"

    sequence do
      map_element :effectExtent, to: :effect_extent
    end
    map_attribute :distT, to: :dist_t
    map_attribute :distB, to: :dist_b
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_wrap_top_bottom)
  end
end

CTWrapTopBottom.register_class_with_id
