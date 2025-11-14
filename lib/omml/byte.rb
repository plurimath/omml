# frozen_string_literal: true
require "lutaml/model"

class Byte < Lutaml::Model::Type::Integer
  def self.cast(value, options = {})
    return if value.nil?

    options[:max] = 127
    options[:min] = -128
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :byte)
  end
end

Byte.register_class_with_id
