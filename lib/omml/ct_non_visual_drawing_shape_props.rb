# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_shape_locking"
require_relative "ct_office_art_extension_list"
class CTNonVisualDrawingShapeProps < Lutaml::Model::Serializable
  attribute :sp_locks, :ct_shape_locking, collection: 0..1
  attribute :ext_lst, :ct_office_art_extension_list, collection: 0..1
  attribute :tx_box, :boolean

  xml do
    root "NonVisualDrawingShapeProps", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :spLocks, to: :sp_locks
      map_element :extLst, to: :ext_lst
    end
    map_attribute :txBox, to: :tx_box
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_non_visual_drawing_shape_props)
  end
end

CTNonVisualDrawingShapeProps.register_class_with_id
