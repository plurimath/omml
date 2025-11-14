# frozen_string_literal: true
require "lutaml/model"

class STHAnchor < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("text"), super("margin"), super("page")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_h_anchor)
  end
end

STHAnchor.register_class_with_id
