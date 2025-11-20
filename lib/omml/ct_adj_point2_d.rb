# frozen_string_literal: true

require "lutaml/model"
require_relative "st_adj_coordinate"
class CTAdjPoint2D < Lutaml::Model::Serializable
  attribute :x, :st_adj_coordinate
  attribute :y, :st_adj_coordinate

  xml do
    root "AdjPoint2D", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :x, to: :x
    map_attribute :y, to: :y
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_adj_point2_d)
  end
end

CTAdjPoint2D.register_class_with_id
