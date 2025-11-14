# frozen_string_literal: true
require "lutaml/model"

class STInteger255 < Lutaml::Model::Type::Integer
  def self.cast(value, options = {})
    return if value.nil?

    options[:max] = 255
    options[:min] = 1
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_integer255)
  end
end

STInteger255.register_class_with_id
