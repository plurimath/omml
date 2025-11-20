# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_hps_measure"
require_relative "ct_on_off"
class CTFFCheckBox < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :size, :ct_hps_measure
    attribute :size_auto, :ct_on_off
  end
  attribute :default, :ct_on_off, collection: 0..1
  attribute :checked, :ct_on_off, collection: 0..1

  xml do
    root "FFCheckBox", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :size, to: :size
      map_element :sizeAuto, to: :size_auto
      map_element :default, to: :default
      map_element :checked, to: :checked
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ff_check_box)
  end
end

CTFFCheckBox.register_class_with_id
