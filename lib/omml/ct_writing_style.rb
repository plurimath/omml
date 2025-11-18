# frozen_string_literal: true

require "lutaml/model"
require_relative "st_lang"
require_relative "st_decimal_number"
require_relative "st_on_off"
require_relative "st_string"
class CTWritingStyle < Lutaml::Model::Serializable
  attribute :lang, :st_lang
  attribute :vendor_id, :st_decimal_number
  attribute :dll_version, :st_decimal_number
  attribute :nl_check, :st_on_off
  attribute :check_style, :st_on_off
  attribute :app_name, :st_string

  xml do
    root "WritingStyle"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :lang, to: :lang
    map_attribute :vendorID, to: :vendor_id
    map_attribute :dllVersion, to: :dll_version
    map_attribute :nlCheck, to: :nl_check
    map_attribute :checkStyle, to: :check_style
    map_attribute :appName, to: :app_name
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_writing_style)
  end
end

CTWritingStyle.register_class_with_id
