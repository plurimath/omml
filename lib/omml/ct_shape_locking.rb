# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_office_art_extension_list"
class CTShapeLocking < Lutaml::Model::Serializable
  attribute :ext_lst, :ct_office_art_extension_list, collection: 0..1
  attribute :no_grp, :boolean
  attribute :no_select, :boolean
  attribute :no_rot, :boolean
  attribute :no_change_aspect, :boolean
  attribute :no_move, :boolean
  attribute :no_resize, :boolean
  attribute :no_edit_points, :boolean
  attribute :no_adjust_handles, :boolean
  attribute :no_change_arrowheads, :boolean
  attribute :no_change_shape_type, :boolean
  attribute :no_text_edit, :boolean

  xml do
    root "ShapeLocking"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :extLst, to: :ext_lst
    end
    map_attribute :noGrp, to: :no_grp
    map_attribute :noSelect, to: :no_select
    map_attribute :noRot, to: :no_rot
    map_attribute :noChangeAspect, to: :no_change_aspect
    map_attribute :noMove, to: :no_move
    map_attribute :noResize, to: :no_resize
    map_attribute :noEditPoints, to: :no_edit_points
    map_attribute :noAdjustHandles, to: :no_adjust_handles
    map_attribute :noChangeArrowheads, to: :no_change_arrowheads
    map_attribute :noChangeShapeType, to: :no_change_shape_type
    map_attribute :noTextEdit, to: :no_text_edit
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_shape_locking)
  end
end

CTShapeLocking.register_class_with_id
