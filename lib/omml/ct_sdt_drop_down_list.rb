# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_sdt_list_item"
require_relative "st_string"
class CTSdtDropDownList < Lutaml::Model::Serializable
  attribute :list_item, :ct_sdt_list_item, collection: 0..Float::INFINITY
  attribute :last_value, :st_string

  xml do
    root "SdtDropDownList"

    sequence do
      map_element :listItem, to: :list_item
    end
    map_attribute :lastValue, to: :last_value
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_drop_down_list)
  end
end

CTSdtDropDownList.register_class_with_id
