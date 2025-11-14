# frozen_string_literal: true
require "lutaml/model"

class STSignedHpsMeasure < Lutaml::Model::Type::Integer
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_signed_hps_measure)
  end
end

STSignedHpsMeasure.register_class_with_id
