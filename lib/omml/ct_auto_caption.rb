# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
class CTAutoCaption < Lutaml::Model::Serializable
  attribute :name, :st_string
  attribute :caption, :st_string

  xml do
    root "AutoCaption"

    map_attribute :name, to: :name
    map_attribute :caption, to: :caption
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_auto_caption)
  end
end

CTAutoCaption.register_class_with_id
