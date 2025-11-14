# frozen_string_literal: true
require "lutaml/model"

class STHeightRule < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("auto"), super("exact"), super("atLeast")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_height_rule)
  end
end

STHeightRule.register_class_with_id
