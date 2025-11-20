# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_color_transform"
require_relative "st_percentage"
class CTScRgbColor < Lutaml::Model::Serializable
  import_model_attributes :eg_color_transform
  attribute :r, :st_percentage
  attribute :g, :st_percentage
  attribute :b, :st_percentage

  xml do
    root "ScRgbColor", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_color_transform
    end
    map_attribute :r, to: :r
    map_attribute :g, to: :g
    map_attribute :b, to: :b
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sc_rgb_color)
  end
end

CTScRgbColor.register_class_with_id
