# frozen_string_literal: true
require "lutaml/model"

class STSignedTwipsMeasure < Lutaml::Model::Type::Integer
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_signed_twips_measure)
  end
end

STSignedTwipsMeasure.register_class_with_id
