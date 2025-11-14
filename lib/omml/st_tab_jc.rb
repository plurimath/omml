# frozen_string_literal: true
require "lutaml/model"

class STTabJc < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("clear"), super("left"), super("center"), super("right"), super("decimal"), super("bar"), super("num")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_tab_jc)
  end
end

STTabJc.register_class_with_id
