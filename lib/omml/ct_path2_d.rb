# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_path2_d_close"
require_relative "ct_path2_d_move_to"
require_relative "ct_path2_d_line_to"
require_relative "ct_path2_d_arc_to"
require_relative "ct_path2_d_quad_bezier_to"
require_relative "ct_path2_d_cubic_bezier_to"
require_relative "st_positive_coordinate"
require_relative "st_path_fill_mode"
class CTPath2D < Lutaml::Model::Serializable
  choice(min: 0, max: Float::INFINITY) do
    attribute :close, :ct_path2_d_close, collection: 1..1
    attribute :move_to, :ct_path2_d_move_to, collection: 1..1
    attribute :ln_to, :ct_path2_d_line_to, collection: 1..1
    attribute :arc_to, :ct_path2_d_arc_to, collection: 1..1
    attribute :quad_bez_to, :ct_path2_d_quad_bezier_to, collection: 1..1
    attribute :cubic_bez_to, :ct_path2_d_cubic_bezier_to, collection: 1..1
  end
  attribute :w, :st_positive_coordinate
  attribute :h, :st_positive_coordinate
  attribute :fill, :st_path_fill_mode
  attribute :stroke, :boolean
  attribute :extrusion_ok, :boolean

  xml do
    root "Path2D"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_element :close, to: :close
    map_element :moveTo, to: :move_to
    map_element :lnTo, to: :ln_to
    map_element :arcTo, to: :arc_to
    map_element :quadBezTo, to: :quad_bez_to
    map_element :cubicBezTo, to: :cubic_bez_to
    map_attribute :w, to: :w
    map_attribute :h, to: :h
    map_attribute :fill, to: :fill
    map_attribute :stroke, to: :stroke
    map_attribute :extrusionOk, to: :extrusion_ok
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_path2_d)
  end
end

CTPath2D.register_class_with_id
