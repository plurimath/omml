# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_group_locking"
require_relative "ct_office_art_extension_list"
class CTNonVisualGroupDrawingShapeProps < Lutaml::Model::Serializable
  attribute :grp_sp_locks, :ct_group_locking, collection: 0..1
  attribute :ext_lst, :ct_office_art_extension_list, collection: 0..1

  xml do
    root "NonVisualGroupDrawingShapeProps"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :grpSpLocks, to: :grp_sp_locks
      map_element :extLst, to: :ext_lst
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_non_visual_group_drawing_shape_props)
  end
end

CTNonVisualGroupDrawingShapeProps.register_class_with_id
