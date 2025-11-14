# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_tbl_width"
class CTTcMar < Lutaml::Model::Serializable
  attribute :top, :ct_tbl_width, collection: 0..1
  attribute :left, :ct_tbl_width, collection: 0..1
  attribute :bottom, :ct_tbl_width, collection: 0..1
  attribute :right, :ct_tbl_width, collection: 0..1

  xml do
    root "TcMar"

    sequence do
      map_element :top, to: :top
      map_element :left, to: :left
      map_element :bottom, to: :bottom
      map_element :right, to: :right
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tc_mar)
  end
end

CTTcMar.register_class_with_id
