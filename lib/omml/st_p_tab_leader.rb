# frozen_string_literal: true
require "lutaml/model"

class STPTabLeader < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("dot"), super("hyphen"), super("underscore"), super("middleDot")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_p_tab_leader)
  end
end

STPTabLeader.register_class_with_id
