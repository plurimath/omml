# frozen_string_literal: true

require_relative "ct_track_change"
class EGParaRPrTrackChanges < Lutaml::Model::Serializable
  attribute :ins, :ct_track_change, collection: 0..1
  attribute :del, :ct_track_change, collection: 0..1
  attribute :move_from, :ct_track_change, collection: 0..1
  attribute :move_to, :ct_track_change, collection: 0..1

  xml do
    no_root
    sequence do
      map_element :ins, to: :ins
      map_element :del, to: :del
      map_element :moveFrom, to: :move_from
      map_element :moveTo, to: :move_to
    end
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_para_r_pr_track_changes)
  end
end

EGParaRPrTrackChanges.register_class_with_id
