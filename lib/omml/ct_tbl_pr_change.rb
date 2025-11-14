# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "ct_tbl_pr_base"
class CTTblPrChange < CTTrackChange
  attribute :tbl_pr, :ct_tbl_pr_base

  xml do
    root "TblPrChange"

    sequence do
      map_element :tblPr, to: :tbl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_pr_change)
  end
end

CTTblPrChange.register_class_with_id
