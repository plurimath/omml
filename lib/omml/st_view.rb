# frozen_string_literal: true
require "lutaml/model"

class STView < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("print"), super("outline"), super("masterPages"), super("normal"), super("web")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_view)
  end
end

STView.register_class_with_id
