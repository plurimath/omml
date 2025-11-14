# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_wrap_path"
require_relative "st_wrap_text"
require_relative "st_wrap_distance"
class CTWrapThrough < Lutaml::Model::Serializable
  attribute :wrap_polygon, :ct_wrap_path, collection: 1..1
  attribute :wrap_text, :st_wrap_text
  attribute :dist_l, :st_wrap_distance
  attribute :dist_r, :st_wrap_distance

  xml do
    root "WrapThrough"

    sequence do
      map_element :wrapPolygon, to: :wrap_polygon
    end
    map_attribute :wrapText, to: :wrap_text
    map_attribute :distL, to: :dist_l
    map_attribute :distR, to: :dist_r
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_wrap_through)
  end
end

CTWrapThrough.register_class_with_id
