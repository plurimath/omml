# frozen_string_literal: true
require "lutaml/model"

class STEm < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("dot"), super("comma"), super("circle"), super("underDot")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_em)
  end
end

STEm.register_class_with_id
