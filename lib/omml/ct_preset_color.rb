# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_color_transform"
require_relative "st_preset_color_val"
class CTPresetColor < Lutaml::Model::Serializable
  import_model_attributes :eg_color_transform
  attribute :val, :st_preset_color_val

  xml do
    root "PresetColor"

    sequence do
      import_model_mappings :eg_color_transform
    end
    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_preset_color)
  end
end

CTPresetColor.register_class_with_id
