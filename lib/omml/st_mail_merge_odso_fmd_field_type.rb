# frozen_string_literal: true
require "lutaml/model"

class STMailMergeOdsoFMDFieldType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("null"), super("dbColumn")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_mail_merge_odso_fmd_field_type)
  end
end

STMailMergeOdsoFMDFieldType.register_class_with_id
