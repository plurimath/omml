# frozen_string_literal: true
require "lutaml/model"

require_relative "st_percentage"
require_relative "st_percentage"
class STPositiveFixedPercentage < STPercentage
  def self.cast(value, options = {})
    return if value.nil?

    options[:max] = 100000
    options[:min] = 0
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_positive_fixed_percentage)
  end
end

STPositiveFixedPercentage.register_class_with_id
