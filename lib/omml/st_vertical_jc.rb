# frozen_string_literal: true
require "lutaml/model"

class STVerticalJc < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("top"), super("center"), super("both"), super("bottom")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_vertical_jc)
  end
end

STVerticalJc.register_class_with_id
