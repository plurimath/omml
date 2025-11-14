# frozen_string_literal: true
require "lutaml/model"

require_relative "st_unsigned_decimal_number"
require_relative "st_unsigned_decimal_number"
class STHpsMeasure < STUnsignedDecimalNumber
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_hps_measure)
  end
end

STHpsMeasure.register_class_with_id
