# frozen_string_literal: true

require "lutaml/model"
require_relative "st_coordinate"
class CTPoint2D < Lutaml::Model::Serializable
  attribute :x, :st_coordinate
  attribute :y, :st_coordinate

  xml do
    root "Point2D", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :x, to: :x
    map_attribute :y, to: :y
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_point2_d)
  end
end

CTPoint2D.register_class_with_id
