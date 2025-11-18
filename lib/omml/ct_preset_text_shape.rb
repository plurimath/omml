# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_geom_guide_list"
require_relative "st_text_shape_type"
class CTPresetTextShape < Lutaml::Model::Serializable
  attribute :av_lst, :ct_geom_guide_list, collection: 0..1
  attribute :prst, :st_text_shape_type

  xml do
    root "PresetTextShape"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :avLst, to: :av_lst
    end
    map_attribute :prst, to: :prst
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_preset_text_shape)
  end
end

CTPresetTextShape.register_class_with_id
