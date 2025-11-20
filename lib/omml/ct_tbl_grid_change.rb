# frozen_string_literal: true

require_relative "ct_markup"
require_relative "ct_tbl_grid_base"
class CTTblGridChange < CTMarkup
  attribute :tbl_grid, :ct_tbl_grid_base

  xml do
    root "TblGridChange", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :tblGrid, to: :tbl_grid
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_grid_change)
  end
end

CTTblGridChange.register_class_with_id
