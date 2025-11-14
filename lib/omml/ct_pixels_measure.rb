# frozen_string_literal: true

require "lutaml/model"
require_relative "st_pixels_measure"
class CTPixelsMeasure < Lutaml::Model::Serializable
  attribute :val, :st_pixels_measure

  xml do
    root "PixelsMeasure"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_pixels_measure)
  end
end

CTPixelsMeasure.register_class_with_id
