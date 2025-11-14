# frozen_string_literal: true
require "lutaml/model"

class STDocPartType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("normal"), super("autoExp"), super("toolbar"), super("speller"), super("formFld"), super("bbPlcHdr")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_doc_part_type)
  end
end

STDocPartType.register_class_with_id
