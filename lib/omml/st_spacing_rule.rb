# frozen_string_literal: true
require "lutaml/model"

class STSpacingRule < Lutaml::Model::Type::Integer
  def self.cast(value, options = {})
    return if value.nil?

    options[:max] = 4
    options[:min] = 0
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_spacing_rule)
  end
end

STSpacingRule.register_class_with_id
