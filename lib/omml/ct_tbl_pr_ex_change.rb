# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "ct_tbl_pr_ex_base"
class CTTblPrExChange < CTTrackChange
  attribute :tbl_pr_ex, :ct_tbl_pr_ex_base, collection: 1..1

  xml do
    root "TblPrExChange"

    sequence do
      map_element :tblPrEx, to: :tbl_pr_ex
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_pr_ex_change)
  end
end

CTTblPrExChange.register_class_with_id
