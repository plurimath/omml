# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_p_pr"
require_relative "eg_p_content"
require_relative "st_long_hex_number"
class CTP < Lutaml::Model::Serializable
  attribute :p_pr, :ct_p_pr, collection: 0..1
  import_model_attributes :eg_p_content
  attribute :rsid_r_pr, :st_long_hex_number
  attribute :rsid_r, :st_long_hex_number
  attribute :rsid_del, :st_long_hex_number
  attribute :rsid_p, :st_long_hex_number
  attribute :rsid_r_default, :st_long_hex_number

  xml do
    root "P"

    sequence do
      map_element :pPr, to: :p_pr
      import_model_mappings :eg_p_content
    end
    map_attribute :rsidRPr, to: :rsid_r_pr
    map_attribute :rsidR, to: :rsid_r
    map_attribute :rsidDel, to: :rsid_del
    map_attribute :rsidP, to: :rsid_p
    map_attribute :rsidRDefault, to: :rsid_r_default
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_p)
  end
end

CTP.register_class_with_id
