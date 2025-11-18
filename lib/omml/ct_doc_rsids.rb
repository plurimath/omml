# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_long_hex_number"
class CTDocRsids < Lutaml::Model::Serializable
  attribute :rsid_root, :ct_long_hex_number, collection: 0..1
  attribute :rsid, :ct_long_hex_number, collection: 0..Float::INFINITY

  xml do
    root "DocRsids"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :rsidRoot, to: :rsid_root
      map_element :rsid, to: :rsid
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_rsids)
  end
end

CTDocRsids.register_class_with_id
