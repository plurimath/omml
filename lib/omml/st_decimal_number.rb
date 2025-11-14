# frozen_string_literal: true
require "lutaml/model"

class STDecimalNumber < Lutaml::Model::Type::Integer
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_decimal_number)
  end
end

STDecimalNumber.register_class_with_id
