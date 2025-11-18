# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
class CTSdtListItem < Lutaml::Model::Serializable
  attribute :display_text, :st_string
  attribute :value, :st_string

  xml do
    root "SdtListItem"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :displayText, to: :display_text
    map_attribute :value, to: :value
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_list_item)
  end
end

CTSdtListItem.register_class_with_id
