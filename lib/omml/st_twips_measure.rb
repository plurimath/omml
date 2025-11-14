# frozen_string_literal: true
require "lutaml/model"

require_relative "unsigned_int"
require_relative "unsigned_int"
class STTwipsMeasure < UnsignedInt
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_twips_measure)
  end
end

STTwipsMeasure.register_class_with_id
