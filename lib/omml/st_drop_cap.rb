# frozen_string_literal: true
require "lutaml/model"

class STDropCap < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("drop"), super("margin")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_drop_cap)
  end
end

STDropCap.register_class_with_id
