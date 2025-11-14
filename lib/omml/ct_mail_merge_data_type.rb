# frozen_string_literal: true

require "lutaml/model"
require_relative "st_mail_merge_data_type"
class CTMailMergeDataType < Lutaml::Model::Serializable
  attribute :val, :st_mail_merge_data_type

  xml do
    root "MailMergeDataType"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_mail_merge_data_type)
  end
end

CTMailMergeDataType.register_class_with_id
