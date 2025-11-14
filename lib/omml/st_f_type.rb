# frozen_string_literal: true
require "lutaml/model"

class STFType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("bar"), super("skw"), super("lin"), super("noBar")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_f_type)
  end
end

STFType.register_class_with_id
