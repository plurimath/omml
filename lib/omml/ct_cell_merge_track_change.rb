# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "st_annotation_v_merge"
class CTCellMergeTrackChange < CTTrackChange
  attribute :v_merge, :st_annotation_v_merge
  attribute :v_merge_orig, :st_annotation_v_merge

  xml do
    root "CellMergeTrackChange", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :vMerge, to: :v_merge
    map_attribute :vMergeOrig, to: :v_merge_orig
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_cell_merge_track_change)
  end
end

CTCellMergeTrackChange.register_class_with_id
