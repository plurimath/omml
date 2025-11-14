# frozen_string_literal: true
require "lutaml/model"

class STFldCharType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("begin"), super("separate"), super("end")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_fld_char_type)
  end
end

STFldCharType.register_class_with_id
