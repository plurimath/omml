# frozen_string_literal: true

require "lutaml/model"
require_relative "st_text_scale"
class CTTextScale < Lutaml::Model::Serializable
  attribute :val, :st_text_scale

  xml do
    root "TextScale"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_text_scale)
  end
end

CTTextScale.register_class_with_id
