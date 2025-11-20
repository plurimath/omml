# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_sect_pr_contents"
require_relative "st_long_hex_number"
class CTSectPrBase < Lutaml::Model::Serializable
  import_model_attributes :eg_sect_pr_contents
  attribute :rsid_r_pr, :st_long_hex_number
  attribute :rsid_del, :st_long_hex_number
  attribute :rsid_r, :st_long_hex_number
  attribute :rsid_sect, :st_long_hex_number

  xml do
    root "SectPrBase", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_sect_pr_contents
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
    register.register_model(self, id: :ct_sect_pr_base)
  end
end

CTSectPrBase.register_class_with_id
