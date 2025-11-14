# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_char"
require_relative "ct_on_off"
require_relative "ct_shp"
require_relative "ct_ctrl_pr"
class CTDPr < Lutaml::Model::Serializable
  attribute :beg_chr, :ct_char, collection: 0..1
  attribute :sep_chr, :ct_char, collection: 0..1
  attribute :end_chr, :ct_char, collection: 0..1
  attribute :grow, :ct_on_off, collection: 0..1
  attribute :shp, :ct_shp, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "DPr"

    sequence do
      map_element :begChr, to: :beg_chr
      map_element :sepChr, to: :sep_chr
      map_element :endChr, to: :end_chr
      map_element :grow, to: :grow
      map_element :shp, to: :shp
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_d_pr)
  end
end

CTDPr.register_class_with_id
