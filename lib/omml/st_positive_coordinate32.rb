# frozen_string_literal: true
require "lutaml/model"

require_relative "st_coordinate32"
require_relative "st_coordinate32"
class STPositiveCoordinate32 < STCoordinate32
  def self.cast(value, options = {})
    return if value.nil?

    options[:min] = 0
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_positive_coordinate32)
  end
end

STPositiveCoordinate32.register_class_with_id
