# frozen_string_literal: true
require "lutaml/model"

class STPTabRelativeTo < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("margin"), super("indent")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_p_tab_relative_to)
  end
end

STPTabRelativeTo.register_class_with_id
