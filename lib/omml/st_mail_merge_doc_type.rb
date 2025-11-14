# frozen_string_literal: true
require "lutaml/model"

class STMailMergeDocType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("catalog"), super("envelopes"), super("mailingLabels"), super("formLetters"), super("email"), super("fax")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_mail_merge_doc_type)
  end
end

STMailMergeDocType.register_class_with_id
