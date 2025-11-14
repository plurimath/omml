# frozen_string_literal: true
require "lutaml/model"

class NonNegativeInteger < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:pattern] = %r{(?-mix:\+?[0-9]+)}
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :non_negative_integer)
  end
end

NonNegativeInteger.register_class_with_id
