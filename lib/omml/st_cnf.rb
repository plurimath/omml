# frozen_string_literal: true
require "lutaml/model"

class STCnf < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:pattern] = %r{([01]*)}
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_cnf)
  end
end

STCnf.register_class_with_id
