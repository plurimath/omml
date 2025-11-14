# frozen_string_literal: true
require "lutaml/model"

class STInteger2 < Lutaml::Model::Type::Integer
  def self.cast(value, options = {})
    return if value.nil?

    options[:max] = 2
    options[:min] = -2
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_integer2)
  end
end

STInteger2.register_class_with_id
