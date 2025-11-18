# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_decimal_number"
require_relative "ct_num_lvl"
require_relative "st_decimal_number"
class CTNum < Lutaml::Model::Serializable
  attribute :abstract_num_id, :ct_decimal_number, collection: 1..1
  attribute :lvl_override, :ct_num_lvl, collection: 0..9
  attribute :num_id, :st_decimal_number

  xml do
    root "Num"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :abstractNumId, to: :abstract_num_id
      map_element :lvlOverride, to: :lvl_override
    end
    map_attribute :numId, to: :num_id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_num)
  end
end

CTNum.register_class_with_id
