# frozen_string_literal: true

require "lutaml/model"
require_relative "nc_name"
class CTText < Lutaml::Model::Serializable

  attribute :content, :st_string
  attribute :space, :nc_name
  xml do
    root "Text"

    map_content to: :content
    map_attribute :space, to: :space, namespace: "http://www.w3.org/XML/1998/namespace", prefix: "xml"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_text)
  end
end

CTText.register_class_with_id
