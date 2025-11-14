# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_border"
class CTPBdr < Lutaml::Model::Serializable
  attribute :top, :ct_border, collection: 0..1
  attribute :left, :ct_border, collection: 0..1
  attribute :bottom, :ct_border, collection: 0..1
  attribute :right, :ct_border, collection: 0..1
  attribute :between, :ct_border, collection: 0..1
  attribute :bar, :ct_border, collection: 0..1

  xml do
    root "PBdr"

    sequence do
      map_element :top, to: :top
      map_element :left, to: :left
      map_element :bottom, to: :bottom
      map_element :right, to: :right
      map_element :between, to: :between
      map_element :bar, to: :bar
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_p_bdr)
  end
end

CTPBdr.register_class_with_id
