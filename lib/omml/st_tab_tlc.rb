# frozen_string_literal: true
require "lutaml/model"

class STTabTlc < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("dot"), super("hyphen"), super("underscore"), super("heavy"), super("middleDot")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_tab_tlc)
  end
end

STTabTlc.register_class_with_id
