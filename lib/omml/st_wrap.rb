# frozen_string_literal: true
require "lutaml/model"

class STWrap < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("auto"), super("notBeside"), super("around"), super("tight"), super("through"), super("none")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_wrap)
  end
end

STWrap.register_class_with_id
