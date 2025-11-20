# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_on_off"
require_relative "ct_ctrl_pr"
class CTBorderBoxPr < Lutaml::Model::Serializable
  attribute :hide_top, :ct_on_off, collection: 0..1
  attribute :hide_bot, :ct_on_off, collection: 0..1
  attribute :hide_left, :ct_on_off, collection: 0..1
  attribute :hide_right, :ct_on_off, collection: 0..1
  attribute :strike_h, :ct_on_off, collection: 0..1
  attribute :strike_v, :ct_on_off, collection: 0..1
  attribute :strike_bltr, :ct_on_off, collection: 0..1
  attribute :strike_tlbr, :ct_on_off, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "BorderBoxPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :hideTop, to: :hide_top
      map_element :hideBot, to: :hide_bot
      map_element :hideLeft, to: :hide_left
      map_element :hideRight, to: :hide_right
      map_element :strikeH, to: :strike_h
      map_element :strikeV, to: :strike_v
      map_element :strikeBLTR, to: :strike_bltr
      map_element :strikeTLBR, to: :strike_tlbr
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_border_box_pr)
  end
end

CTBorderBoxPr.register_class_with_id
