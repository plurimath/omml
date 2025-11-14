# frozen_string_literal: true
require "lutaml/model"

class STScript < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("roman"), super("script"), super("fraktur"), super("double-struck"), super("sans-serif"), super("monospace")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_script)
  end
end

STScript.register_class_with_id
