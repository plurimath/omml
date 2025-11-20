# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_tbl_pr_ex"
require_relative "ct_tr_pr"
require_relative "eg_content_cell_content"
require_relative "st_long_hex_number"
class CTRow < Lutaml::Model::Serializable
  attribute :tbl_pr_ex, :ct_tbl_pr_ex, collection: 0..1
  attribute :tr_pr, :ct_tr_pr, collection: 0..1
  import_model_attributes :eg_content_cell_content
  attribute :rsid_r_pr, :st_long_hex_number
  attribute :rsid_r, :st_long_hex_number
  attribute :rsid_del, :st_long_hex_number
  attribute :rsid_tr, :st_long_hex_number

  xml do
    root "Row", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :tblPrEx, to: :tbl_pr_ex
      map_element :trPr, to: :tr_pr
      import_model_mappings :eg_content_cell_content
    end
    map_attribute :rsidRPr, to: :rsid_r_pr
    map_attribute :rsidR, to: :rsid_r
    map_attribute :rsidDel, to: :rsid_del
    map_attribute :rsidTr, to: :rsid_tr
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_row)
  end
end

CTRow.register_class_with_id
