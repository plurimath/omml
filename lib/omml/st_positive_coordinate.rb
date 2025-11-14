# frozen_string_literal: true
require "lutaml/model"

require_relative "long"
require_relative "long"
class STPositiveCoordinate < Long
  def self.cast(value, options = {})
    return if value.nil?

    options[:max] = 27273042316900
    options[:min] = 0
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_positive_coordinate)
  end
end

STPositiveCoordinate.register_class_with_id
