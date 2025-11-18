# frozen_string_literal: true

require_relative "ct_perm"
require_relative "st_ed_grp"
require_relative "st_string"
require_relative "st_decimal_number"
class CTPermStart < CTPerm
  attribute :ed_grp, :st_ed_grp
  attribute :ed, :st_string
  attribute :col_first, :st_decimal_number
  attribute :col_last, :st_decimal_number

  xml do
    root "PermStart"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :edGrp, to: :ed_grp
    map_attribute :ed, to: :ed
    map_attribute :colFirst, to: :col_first
    map_attribute :colLast, to: :col_last
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_perm_start)
  end
end

CTPermStart.register_class_with_id
