# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
require_relative "st_on_off"
require_relative "st_decimal_number"
class CTLsdException < Lutaml::Model::Serializable
  attribute :name, :st_string
  attribute :locked, :st_on_off
  attribute :ui_priority, :st_decimal_number
  attribute :semi_hidden, :st_on_off
  attribute :unhide_when_used, :st_on_off
  attribute :q_format, :st_on_off

  xml do
    root "LsdException", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :name, to: :name
    map_attribute :locked, to: :locked
    map_attribute :uiPriority, to: :ui_priority
    map_attribute :semiHidden, to: :semi_hidden
    map_attribute :unhideWhenUsed, to: :unhide_when_used
    map_attribute :qFormat, to: :q_format
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_lsd_exception)
  end
end

CTLsdException.register_class_with_id
