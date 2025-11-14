# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_office_art_extension_list"
class CTGraphicalObjectFrameLocking < Lutaml::Model::Serializable
  attribute :ext_lst, :ct_office_art_extension_list, collection: 0..1
  attribute :no_grp, :boolean
  attribute :no_drilldown, :boolean
  attribute :no_select, :boolean
  attribute :no_change_aspect, :boolean
  attribute :no_move, :boolean
  attribute :no_resize, :boolean

  xml do
    root "GraphicalObjectFrameLocking"

    sequence do
      map_element :extLst, to: :ext_lst
    end
    map_attribute :noGrp, to: :no_grp
    map_attribute :noDrilldown, to: :no_drilldown
    map_attribute :noSelect, to: :no_select
    map_attribute :noChangeAspect, to: :no_change_aspect
    map_attribute :noMove, to: :no_move
    map_attribute :noResize, to: :no_resize
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_graphical_object_frame_locking)
  end
end

CTGraphicalObjectFrameLocking.register_class_with_id
