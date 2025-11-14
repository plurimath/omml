# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_long_hex_number"
require_relative "ct_multi_level_type"
require_relative "ct_string"
require_relative "ct_lvl"
require_relative "st_decimal_number"
class CTAbstractNum < Lutaml::Model::Serializable
  attribute :nsid, :ct_long_hex_number, collection: 0..1
  attribute :multi_level_type, :ct_multi_level_type, collection: 0..1
  attribute :tmpl, :ct_long_hex_number, collection: 0..1
  attribute :name, :ct_string, collection: 0..1
  attribute :style_link, :ct_string, collection: 0..1
  attribute :num_style_link, :ct_string, collection: 0..1
  attribute :lvl, :ct_lvl, collection: 0..9
  attribute :abstract_num_id, :st_decimal_number

  xml do
    root "AbstractNum"

    sequence do
      map_element :nsid, to: :nsid
      map_element :multiLevelType, to: :multi_level_type
      map_element :tmpl, to: :tmpl
      map_element :name, to: :name
      map_element :styleLink, to: :style_link
      map_element :numStyleLink, to: :num_style_link
      map_element :lvl, to: :lvl
    end
    map_attribute :abstractNumId, to: :abstract_num_id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_abstract_num)
  end
end

CTAbstractNum.register_class_with_id
