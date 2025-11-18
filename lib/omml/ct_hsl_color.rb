# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_color_transform"
require_relative "st_positive_fixed_angle"
require_relative "st_percentage"
class CTHslColor < Lutaml::Model::Serializable
  import_model_attributes :eg_color_transform
  attribute :hue, :st_positive_fixed_angle
  attribute :sat, :st_percentage
  attribute :lum, :st_percentage

  xml do
    root "HslColor"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_color_transform
    end
    map_attribute :hue, to: :hue
    map_attribute :sat, to: :sat
    map_attribute :lum, to: :lum
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_hsl_color)
  end
end

CTHslColor.register_class_with_id
