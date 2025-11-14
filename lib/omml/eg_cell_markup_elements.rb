# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "ct_cell_merge_track_change"
class EGCellMarkupElements < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :cell_ins, :ct_track_change, collection: 0..1
    attribute :cell_del, :ct_track_change, collection: 0..1
    attribute :cell_merge, :ct_cell_merge_track_change, collection: 0..1
  end

  xml do
    no_root
    map_element :cellIns, to: :cell_ins
    map_element :cellDel, to: :cell_del
    map_element :cellMerge, to: :cell_merge
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_cell_markup_elements)
  end
end

EGCellMarkupElements.register_class_with_id
