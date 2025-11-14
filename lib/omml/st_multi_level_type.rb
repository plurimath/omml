# frozen_string_literal: true
require "lutaml/model"

class STMultiLevelType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("singleLevel"), super("multilevel"), super("hybridMultilevel")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_multi_level_type)
  end
end

STMultiLevelType.register_class_with_id
