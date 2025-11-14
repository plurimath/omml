# frozen_string_literal: true

require "lutaml/model"
require_relative "st_text_direction"
class CTTextDirection < Lutaml::Model::Serializable
  attribute :val, :st_text_direction

  xml do
    root "TextDirection"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_text_direction)
  end
end

CTTextDirection.register_class_with_id
