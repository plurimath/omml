# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_picture_locking"
require_relative "ct_office_art_extension_list"
class CTNonVisualPictureProperties < Lutaml::Model::Serializable
  attribute :pic_locks, :ct_picture_locking, collection: 0..1
  attribute :ext_lst, :ct_office_art_extension_list, collection: 0..1
  attribute :prefer_relative_resize, :boolean

  xml do
    root "NonVisualPictureProperties"

    sequence do
      map_element :picLocks, to: :pic_locks
      map_element :extLst, to: :ext_lst
    end
    map_attribute :preferRelativeResize, to: :prefer_relative_resize
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_non_visual_picture_properties)
  end
end

CTNonVisualPictureProperties.register_class_with_id
