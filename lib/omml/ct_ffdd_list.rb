# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_decimal_number"
require_relative "ct_string"
class CTFFDDList < Lutaml::Model::Serializable
  attribute :result, :ct_decimal_number, collection: 0..1
  attribute :default, :ct_decimal_number, collection: 0..1
  attribute :list_entry, :ct_string, collection: 0..Float::INFINITY

  xml do
    root "FFDDList"

    sequence do
      map_element :result, to: :result
      map_element :default, to: :default
      map_element :listEntry, to: :list_entry
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ffdd_list)
  end
end

CTFFDDList.register_class_with_id
