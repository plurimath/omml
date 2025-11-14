# frozen_string_literal: true

require "lutaml/model"
require_relative "st_decimal_number"
class CTMarkup < Lutaml::Model::Serializable
  attribute :id, :st_decimal_number

  xml do
    root "Markup"

    map_attribute :id, to: :id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_markup)
  end
end

CTMarkup.register_class_with_id
