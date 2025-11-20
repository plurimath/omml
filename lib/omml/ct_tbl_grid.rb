# frozen_string_literal: true

require_relative "ct_tbl_grid_base"
require_relative "ct_tbl_grid_change"
class CTTblGrid < CTTblGridBase
  attribute :tbl_grid_change, :ct_tbl_grid_change, collection: 0..1

  xml do
    root "TblGrid", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :tblGridChange, to: :tbl_grid_change
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_grid)
  end
end

CTTblGrid.register_class_with_id
