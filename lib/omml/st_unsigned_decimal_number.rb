# frozen_string_literal: true
require "lutaml/model"

require_relative "unsigned_long"
require_relative "unsigned_long"
class STUnsignedDecimalNumber < UnsignedLong
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_unsigned_decimal_number)
  end
end

STUnsignedDecimalNumber.register_class_with_id
