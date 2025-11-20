# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_mail_merge_doc_type"
require_relative "ct_on_off"
require_relative "ct_mail_merge_data_type"
require_relative "ct_string"
require_relative "ct_rel"
require_relative "ct_mail_merge_dest"
require_relative "ct_decimal_number"
require_relative "ct_odso"
class CTMailMerge < Lutaml::Model::Serializable
  attribute :main_document_type, :ct_mail_merge_doc_type, collection: 1..1
  attribute :link_to_query, :ct_on_off, collection: 0..1
  attribute :data_type, :ct_mail_merge_data_type, collection: 1..1
  attribute :connect_string, :ct_string, collection: 0..1
  attribute :query, :ct_string, collection: 0..1
  attribute :data_source, :ct_rel, collection: 0..1
  attribute :header_source, :ct_rel, collection: 0..1
  attribute :do_not_suppress_blank_lines, :ct_on_off, collection: 0..1
  attribute :destination, :ct_mail_merge_dest, collection: 0..1
  attribute :address_field_name, :ct_string, collection: 0..1
  attribute :mail_subject, :ct_string, collection: 0..1
  attribute :mail_as_attachment, :ct_on_off, collection: 0..1
  attribute :view_merged_data, :ct_on_off, collection: 0..1
  attribute :active_record, :ct_decimal_number, collection: 0..1
  attribute :check_errors, :ct_decimal_number, collection: 0..1
  attribute :odso, :ct_odso, collection: 0..1

  xml do
    root "MailMerge", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :mainDocumentType, to: :main_document_type
      map_element :linkToQuery, to: :link_to_query
      map_element :dataType, to: :data_type
      map_element :connectString, to: :connect_string
      map_element :query, to: :query
      map_element :dataSource, to: :data_source
      map_element :headerSource, to: :header_source
      map_element :doNotSuppressBlankLines, to: :do_not_suppress_blank_lines
      map_element :destination, to: :destination
      map_element :addressFieldName, to: :address_field_name
      map_element :mailSubject, to: :mail_subject
      map_element :mailAsAttachment, to: :mail_as_attachment
      map_element :viewMergedData, to: :view_merged_data
      map_element :activeRecord, to: :active_record
      map_element :checkErrors, to: :check_errors
      map_element :odso, to: :odso
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_mail_merge)
  end
end

CTMailMerge.register_class_with_id
