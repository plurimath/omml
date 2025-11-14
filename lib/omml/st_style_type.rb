# frozen_string_literal: true
require "lutaml/model"

class STStyleType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("paragraph"), super("character"), super("table"), super("numbering")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_style_type)
  end
end

STStyleType.register_class_with_id
