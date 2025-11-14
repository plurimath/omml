# frozen_string_literal: true
require "lutaml/model"

class STMailMergeDataType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("textFile"), super("database"), super("spreadsheet"), super("query"), super("odbc"), super("native")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_mail_merge_data_type)
  end
end

STMailMergeDataType.register_class_with_id
