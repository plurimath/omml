# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_mail_merge_odso_fmd_field_type"
require_relative "ct_string"
require_relative "ct_decimal_number"
require_relative "ct_lang"
require_relative "ct_on_off"
class CTOdsoFieldMapData < Lutaml::Model::Serializable
  attribute :type, :ct_mail_merge_odso_fmd_field_type, collection: 0..1
  attribute :name, :ct_string, collection: 0..1
  attribute :mapped_name, :ct_string, collection: 0..1
  attribute :column, :ct_decimal_number, collection: 0..1
  attribute :lid, :ct_lang, collection: 0..1
  attribute :dynamic_address, :ct_on_off, collection: 0..1

  xml do
    root "OdsoFieldMapData", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :type, to: :type
      map_element :name, to: :name
      map_element :mappedName, to: :mapped_name
      map_element :column, to: :column
      map_element :lid, to: :lid
      map_element :dynamicAddress, to: :dynamic_address
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_odso_field_map_data)
  end
end

CTOdsoFieldMapData.register_class_with_id
