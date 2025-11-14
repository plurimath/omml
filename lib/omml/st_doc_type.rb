# frozen_string_literal: true
require "lutaml/model"

class STDocType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("notSpecified"), super("letter"), super("eMail")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_doc_type)
  end
end

STDocType.register_class_with_id
