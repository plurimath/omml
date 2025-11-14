# frozen_string_literal: true
require "lutaml/model"
require_relative "st_coordinate"
require_relative "st_geom_guide_name"

class STAdjCoordinate < Lutaml::Model::Type::Value
  def self.cast(value, options = {})
    return if value.nil?

    register.get_class(:st_coordinate).cast(value, options) ||
      register.get_class(:st_geom_guide_name).cast(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_adj_coordinate)
  end
end

STAdjCoordinate.register_class_with_id
