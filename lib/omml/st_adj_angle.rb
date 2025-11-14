# frozen_string_literal: true
require "lutaml/model"
require_relative "st_angle"
require_relative "st_geom_guide_name"

class STAdjAngle < Lutaml::Model::Type::Value
  def self.cast(value, options = {})
    return if value.nil?

    register.get_class(:st_angle).cast(value, options) ||
      register.get_class(:st_geom_guide_name).cast(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_adj_angle)
  end
end

STAdjAngle.register_class_with_id
