# frozen_string_literal: true
require "lutaml/model"

require_relative "st_angle"
require_relative "st_angle"
class STPositiveFixedAngle < STAngle
  def self.cast(value, options = {})
    return if value.nil?

    options[:max] = 21600000
    options[:min] = 0
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_positive_fixed_angle)
  end
end

STPositiveFixedAngle.register_class_with_id
