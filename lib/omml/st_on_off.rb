# frozen_string_literal: true
require "lutaml/model"

class STOnOff < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("on"), super("off")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_on_off)
  end
end

STOnOff.register_class_with_id
