# frozen_string_literal: true

require "lutaml/model"
require_relative "st_signed_twips_measure"
require_relative "st_twips_measure"
class CTPageMar < Lutaml::Model::Serializable
  attribute :top, :st_signed_twips_measure
  attribute :right, :st_twips_measure
  attribute :bottom, :st_signed_twips_measure
  attribute :left, :st_twips_measure
  attribute :header, :st_twips_measure
  attribute :footer, :st_twips_measure
  attribute :gutter, :st_twips_measure

  xml do
    root "PageMar"

    map_attribute :top, to: :top
    map_attribute :right, to: :right
    map_attribute :bottom, to: :bottom
    map_attribute :left, to: :left
    map_attribute :header, to: :header
    map_attribute :footer, to: :footer
    map_attribute :gutter, to: :gutter
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_page_mar)
  end
end

CTPageMar.register_class_with_id
