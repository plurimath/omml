# frozen_string_literal: true

require "lutaml/model"
require_relative "st_on_off"
class CTOnOff < Lutaml::Model::Serializable
  attribute :val, :st_on_off

  xml do
    root "OnOff"
    namespace "http://schemas.openxmlformats.org/wordprocessingml/2006/main", "w"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_on_off)
  end
end

CTOnOff.register_class_with_id
