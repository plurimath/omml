# frozen_string_literal: true

require "lutaml/model"
require_relative "st_on_off"
require_relative "st_decimal_number"
class CTFtnEdnRef < Lutaml::Model::Serializable
  attribute :custom_mark_follows, :st_on_off
  attribute :id, :st_decimal_number

  xml do
    root "FtnEdnRef"

    map_attribute :customMarkFollows, to: :custom_mark_follows
    map_attribute :id, to: :id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ftn_edn_ref)
  end
end

CTFtnEdnRef.register_class_with_id
