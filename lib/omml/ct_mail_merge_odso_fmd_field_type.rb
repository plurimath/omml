# frozen_string_literal: true

require "lutaml/model"
require_relative "st_mail_merge_odso_fmd_field_type"
class CTMailMergeOdsoFMDFieldType < Lutaml::Model::Serializable
  attribute :val, :st_mail_merge_odso_fmd_field_type

  xml do
    root "MailMergeOdsoFMDFieldType"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_mail_merge_odso_fmd_field_type)
  end
end

CTMailMergeOdsoFMDFieldType.register_class_with_id
