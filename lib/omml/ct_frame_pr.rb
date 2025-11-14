# frozen_string_literal: true

require "lutaml/model"
require_relative "st_drop_cap"
require_relative "st_decimal_number"
require_relative "st_twips_measure"
require_relative "st_wrap"
require_relative "st_h_anchor"
require_relative "st_v_anchor"
require_relative "st_signed_twips_measure"
require_relative "st_x_align"
require_relative "st_y_align"
require_relative "st_height_rule"
require_relative "st_on_off"
class CTFramePr < Lutaml::Model::Serializable
  attribute :drop_cap, :st_drop_cap
  attribute :lines, :st_decimal_number
  attribute :w, :st_twips_measure
  attribute :h, :st_twips_measure
  attribute :v_space, :st_twips_measure
  attribute :h_space, :st_twips_measure
  attribute :wrap, :st_wrap
  attribute :h_anchor, :st_h_anchor
  attribute :v_anchor, :st_v_anchor
  attribute :x, :st_signed_twips_measure
  attribute :x_align, :st_x_align
  attribute :y, :st_signed_twips_measure
  attribute :y_align, :st_y_align
  attribute :h_rule, :st_height_rule
  attribute :anchor_lock, :st_on_off

  xml do
    root "FramePr"

    map_attribute :dropCap, to: :drop_cap
    map_attribute :lines, to: :lines
    map_attribute :w, to: :w
    map_attribute :h, to: :h
    map_attribute :vSpace, to: :v_space
    map_attribute :hSpace, to: :h_space
    map_attribute :wrap, to: :wrap
    map_attribute :hAnchor, to: :h_anchor
    map_attribute :vAnchor, to: :v_anchor
    map_attribute :x, to: :x
    map_attribute :xAlign, to: :x_align
    map_attribute :y, to: :y
    map_attribute :yAlign, to: :y_align
    map_attribute :hRule, to: :h_rule
    map_attribute :anchorLock, to: :anchor_lock
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_frame_pr)
  end
end

CTFramePr.register_class_with_id
