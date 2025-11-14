# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_range_markup_elements"
require_relative "ct_tbl_pr"
require_relative "ct_tbl_grid"
require_relative "eg_content_row_content"
class CTTbl < Lutaml::Model::Serializable
  import_model_attributes :eg_range_markup_elements
  attribute :tbl_pr, :ct_tbl_pr
  attribute :tbl_grid, :ct_tbl_grid
  import_model_attributes :eg_content_row_content

  xml do
    root "Tbl"

    sequence do
      import_model_mappings :eg_range_markup_elements
      map_element :tblPr, to: :tbl_pr
      map_element :tblGrid, to: :tbl_grid
      import_model_mappings :eg_content_row_content
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl)
  end
end

CTTbl.register_class_with_id
