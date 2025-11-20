# frozen_string_literal: true

require_relative "ct_tbl_pr_ex_base"
require_relative "ct_tbl_pr_ex_change"
class CTTblPrEx < CTTblPrExBase
  attribute :tbl_pr_ex_change, :ct_tbl_pr_ex_change, collection: 0..1

  xml do
    root "TblPrEx", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :tblPrExChange, to: :tbl_pr_ex_change
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_pr_ex)
  end
end

CTTblPrEx.register_class_with_id
