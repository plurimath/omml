# frozen_string_literal: true
require "lutaml/model"

class STLimLoc < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("undOvr"), super("subSup")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_lim_loc)
  end
end

STLimLoc.register_class_with_id
