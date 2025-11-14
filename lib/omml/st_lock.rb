# frozen_string_literal: true
require "lutaml/model"

class STLock < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("sdtLocked"), super("contentLocked"), super("unlocked"), super("sdtContentLocked")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_lock)
  end
end

STLock.register_class_with_id
