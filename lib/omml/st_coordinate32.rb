# frozen_string_literal: true
require "lutaml/model"

class STCoordinate32 < Lutaml::Model::Type::Integer
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_coordinate32)
  end
end

STCoordinate32.register_class_with_id
