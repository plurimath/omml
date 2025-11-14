# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_xy_adjust_handle"
require_relative "ct_polar_adjust_handle"
class CTAdjustHandleList < Lutaml::Model::Serializable
  choice(min: 0, max: Float::INFINITY) do
    attribute :ah_xy, :ct_xy_adjust_handle, collection: 1..1
    attribute :ah_polar, :ct_polar_adjust_handle, collection: 1..1
  end

  xml do
    root "AdjustHandleList"

    map_element :ahXY, to: :ah_xy
    map_element :ahPolar, to: :ah_polar
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_adjust_handle_list)
  end
end

CTAdjustHandleList.register_class_with_id
