# frozen_string_literal: true
require "lutaml/model"

class STLevelSuffix < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("tab"), super("space"), super("nothing")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_level_suffix)
  end
end

STLevelSuffix.register_class_with_id
