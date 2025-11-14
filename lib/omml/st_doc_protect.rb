# frozen_string_literal: true
require "lutaml/model"

class STDocProtect < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("readOnly"), super("comments"), super("trackedChanges"), super("forms")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_doc_protect)
  end
end

STDocProtect.register_class_with_id
