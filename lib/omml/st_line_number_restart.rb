# frozen_string_literal: true
require "lutaml/model"

class STLineNumberRestart < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("newPage"), super("newSection"), super("continuous")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_line_number_restart)
  end
end

STLineNumberRestart.register_class_with_id
