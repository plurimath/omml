# frozen_string_literal: true

require "lutaml/model"
require_relative "st_sdt_date_mapping_type"
class CTSdtDateMappingType < Lutaml::Model::Serializable
  attribute :val, :st_sdt_date_mapping_type

  xml do
    root "SdtDateMappingType", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_date_mapping_type)
  end
end

CTSdtDateMappingType.register_class_with_id
