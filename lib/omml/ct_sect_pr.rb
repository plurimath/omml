# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_hdr_ftr_references"
require_relative "eg_sect_pr_contents"
require_relative "ct_sect_pr_change"
require_relative "st_long_hex_number"
class CTSectPr < Lutaml::Model::Serializable
  import_model_attributes :eg_hdr_ftr_references
  import_model_attributes :eg_sect_pr_contents
  attribute :sect_pr_change, :ct_sect_pr_change, collection: 0..1
  attribute :rsid_r_pr, :st_long_hex_number
  attribute :rsid_del, :st_long_hex_number
  attribute :rsid_r, :st_long_hex_number
  attribute :rsid_sect, :st_long_hex_number

  xml do
    root "SectPr"

    sequence do
      import_model_mappings :eg_hdr_ftr_references
      import_model_mappings :eg_sect_pr_contents
      map_element :sectPrChange, to: :sect_pr_change
    end
    map_attribute :rsidRPr, to: :rsid_r_pr
    map_attribute :rsidDel, to: :rsid_del
    map_attribute :rsidR, to: :rsid_r
    map_attribute :rsidSect, to: :rsid_sect
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sect_pr)
  end
end

CTSectPr.register_class_with_id
