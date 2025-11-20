# frozen_string_literal: true

require "lutaml/model"
require_relative "st_on_off"
class CTTrackChangesView < Lutaml::Model::Serializable
  attribute :markup, :st_on_off
  attribute :comments, :st_on_off
  attribute :ins_del, :st_on_off
  attribute :formatting, :st_on_off
  attribute :ink_annotations, :st_on_off

  xml do
    root "TrackChangesView", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :markup, to: :markup
    map_attribute :comments, to: :comments
    map_attribute :insDel, to: :ins_del
    map_attribute :formatting, to: :formatting
    map_attribute :inkAnnotations, to: :ink_annotations
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_track_changes_view)
  end
end

CTTrackChangesView.register_class_with_id
