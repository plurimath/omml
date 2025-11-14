# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
require_relative "st_displaced_by_custom_xml"
class CTPerm < Lutaml::Model::Serializable
  attribute :id, :st_string
  attribute :displaced_by_custom_xml, :st_displaced_by_custom_xml

  xml do
    root "Perm"

    map_attribute :id, to: :id
    map_attribute :displacedByCustomXml, to: :displaced_by_custom_xml
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_perm)
  end
end

CTPerm.register_class_with_id
