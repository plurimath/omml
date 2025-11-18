# frozen_string_literal: true

require "lutaml/model"
require_relative "st_tbl_layout_type"
class CTTblLayoutType < Lutaml::Model::Serializable
  attribute :type, :st_tbl_layout_type

  xml do
    root "TblLayoutType"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :type, to: :type
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_layout_type)
  end
end

CTTblLayoutType.register_class_with_id
