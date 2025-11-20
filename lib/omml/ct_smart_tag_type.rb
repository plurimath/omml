# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
class CTSmartTagType < Lutaml::Model::Serializable
  attribute :namespaceuri, :st_string
  attribute :name, :st_string
  attribute :url, :st_string

  xml do
    root "SmartTagType", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :namespaceuri, to: :namespaceuri
    map_attribute :name, to: :name
    map_attribute :url, to: :url
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_smart_tag_type)
  end
end

CTSmartTagType.register_class_with_id
