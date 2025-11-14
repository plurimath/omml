# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_graphical_object_frame_locking"
require_relative "ct_office_art_extension_list"
class CTNonVisualGraphicFrameProperties < Lutaml::Model::Serializable
  attribute :graphic_frame_locks, :ct_graphical_object_frame_locking, collection: 0..1
  attribute :ext_lst, :ct_office_art_extension_list, collection: 0..1

  xml do
    root "NonVisualGraphicFrameProperties"

    sequence do
      map_element :graphicFrameLocks, to: :graphic_frame_locks
      map_element :extLst, to: :ext_lst
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_non_visual_graphic_frame_properties)
  end
end

CTNonVisualGraphicFrameProperties.register_class_with_id
