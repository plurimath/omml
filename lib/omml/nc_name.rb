# frozen_string_literal: true
require "lutaml/model"

class NCName < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:pattern] = %r{(?-mix:\A[a-zA-Z_][\w.-]*\z)}
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :nc_name)
  end
end

NCName.register_class_with_id
