# frozen_string_literal: true
require "lutaml/model"

require_relative "st_angle"
require_relative "st_angle"
class STFixedAngle < STAngle
  def self.cast(value, options = {})
    return if value.nil?

    options[:max] = 5400000
    options[:min] = -5400000
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_fixed_angle)
  end
end

STFixedAngle.register_class_with_id
