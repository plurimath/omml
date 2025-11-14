# frozen_string_literal: true
require "lutaml/model"

class PositiveInteger < Lutaml::Model::Type::Integer
  def self.cast(value, options = {})
    return if value.nil?

    options[:min] = 0
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :positive_integer)
  end
end

PositiveInteger.register_class_with_id
