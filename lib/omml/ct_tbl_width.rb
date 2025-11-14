# frozen_string_literal: true

require "lutaml/model"
require_relative "st_decimal_number"
require_relative "st_tbl_width"
class CTTblWidth < Lutaml::Model::Serializable
  attribute :w, :st_decimal_number
  attribute :type, :st_tbl_width

  xml do
    root "TblWidth"

    map_attribute :w, to: :w
    map_attribute :type, to: :type
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_width)
  end
end

CTTblWidth.register_class_with_id
