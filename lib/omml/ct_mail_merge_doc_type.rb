# frozen_string_literal: true

require "lutaml/model"
require_relative "st_mail_merge_doc_type"
class CTMailMergeDocType < Lutaml::Model::Serializable
  attribute :val, :st_mail_merge_doc_type

  xml do
    root "MailMergeDocType"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_mail_merge_doc_type)
  end
end

CTMailMergeDocType.register_class_with_id
