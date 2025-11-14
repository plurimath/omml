# frozen_string_literal: true
require "lutaml/model"

class STLineSpacingRule < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("auto"), super("exact"), super("atLeast")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_line_spacing_rule)
  end
end

STLineSpacingRule.register_class_with_id
