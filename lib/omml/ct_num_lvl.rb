# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_decimal_number"
require_relative "ct_lvl"
require_relative "st_decimal_number"
class CTNumLvl < Lutaml::Model::Serializable
  attribute :start_override, :ct_decimal_number, collection: 0..1
  attribute :lvl, :ct_lvl, collection: 0..1
  attribute :ilvl, :st_decimal_number

  xml do
    root "NumLvl", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :startOverride, to: :start_override
      map_element :lvl, to: :lvl
    end
    map_attribute :ilvl, to: :ilvl
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_num_lvl)
  end
end

CTNumLvl.register_class_with_id
