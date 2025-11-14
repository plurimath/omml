# frozen_string_literal: true

require_relative "ct_tbl_pr_base"
require_relative "ct_tbl_pr_change"
class CTTblPr < CTTblPrBase
  attribute :tbl_pr_change, :ct_tbl_pr_change, collection: 0..1

  xml do
    root "TblPr"

    sequence do
      map_element :tblPrChange, to: :tbl_pr_change
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_pr)
  end
end

CTTblPr.register_class_with_id
