# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_decimal_number"
require_relative "ct_num_fmt"
require_relative "ct_string"
require_relative "ct_on_off"
require_relative "ct_level_suffix"
require_relative "ct_level_text"
require_relative "ct_lvl_legacy"
require_relative "ct_jc"
require_relative "ct_p_pr"
require_relative "ct_r_pr"
require_relative "st_decimal_number"
require_relative "st_long_hex_number"
require_relative "st_on_off"
class CTLvl < Lutaml::Model::Serializable
  attribute :start, :ct_decimal_number, collection: 0..1
  attribute :num_fmt, :ct_num_fmt, collection: 0..1
  attribute :lvl_restart, :ct_decimal_number, collection: 0..1
  attribute :p_style, :ct_string, collection: 0..1
  attribute :is_lgl, :ct_on_off, collection: 0..1
  attribute :suff, :ct_level_suffix, collection: 0..1
  attribute :lvl_text, :ct_level_text, collection: 0..1
  attribute :lvl_pic_bullet_id, :ct_decimal_number, collection: 0..1
  attribute :legacy, :ct_lvl_legacy, collection: 0..1
  attribute :lvl_jc, :ct_jc, collection: 0..1
  attribute :p_pr, :ct_p_pr, collection: 0..1
  attribute :r_pr, :ct_r_pr, collection: 0..1
  attribute :ilvl, :st_decimal_number
  attribute :tplc, :st_long_hex_number
  attribute :tentative, :st_on_off

  xml do
    root "Lvl"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :start, to: :start
      map_element :numFmt, to: :num_fmt
      map_element :lvlRestart, to: :lvl_restart
      map_element :pStyle, to: :p_style
      map_element :isLgl, to: :is_lgl
      map_element :suff, to: :suff
      map_element :lvlText, to: :lvl_text
      map_element :lvlPicBulletId, to: :lvl_pic_bullet_id
      map_element :legacy, to: :legacy
      map_element :lvlJc, to: :lvl_jc
      map_element :pPr, to: :p_pr
      map_element :rPr, to: :r_pr
    end
    map_attribute :ilvl, to: :ilvl
    map_attribute :tplc, to: :tplc
    map_attribute :tentative, to: :tentative
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_lvl)
  end
end

CTLvl.register_class_with_id
