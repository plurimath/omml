# frozen_string_literal: true

require "lutaml/model"
require_relative "st_geom_guide_name"
require_relative "st_geom_guide_formula"
class CTGeomGuide < Lutaml::Model::Serializable
  attribute :name, :st_geom_guide_name
  attribute :fmla, :st_geom_guide_formula

  xml do
    root "GeomGuide"

    map_attribute :name, to: :name
    map_attribute :fmla, to: :fmla
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_geom_guide)
  end
end

CTGeomGuide.register_class_with_id
