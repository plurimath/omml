# frozen_string_literal: true
require "lutaml/model"

class STRestartNumber < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("continuous"), super("eachSect"), super("eachPage")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_restart_number)
  end
end

STRestartNumber.register_class_with_id
