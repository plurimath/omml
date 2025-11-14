# frozen_string_literal: true
require "lutaml/model"

class Long < Lutaml::Model::Type::Decimal
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :long)
  end
end

Long.register_class_with_id
