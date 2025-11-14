# frozen_string_literal: true
require "lutaml/model"

class STMailMergeSourceType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("database"), super("addressBook"), super("document1"), super("document2"), super("text"), super("email"), super("native"), super("legacy"), super("master")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_mail_merge_source_type)
  end
end

STMailMergeSourceType.register_class_with_id
