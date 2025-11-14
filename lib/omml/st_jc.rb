# frozen_string_literal: true
require "lutaml/model"

class STJc < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("left"), super("right"), super("center"), super("centerGroup")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_jc)
  end
end

STJc.register_class_with_id
