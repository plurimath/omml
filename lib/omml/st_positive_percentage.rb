# frozen_string_literal: true
require "lutaml/model"

require_relative "st_percentage"
require_relative "st_percentage"
class STPositivePercentage < STPercentage
  def self.cast(value, options = {})
    return if value.nil?

    options[:min] = 0
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_positive_percentage)
  end
end

STPositivePercentage.register_class_with_id
