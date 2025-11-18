# frozen_string_literal: true

require "lutaml/model"
require_relative "st_break_bin_sub"
class CTBreakBinSub < Lutaml::Model::Serializable
  attribute :val, :st_break_bin_sub

  xml do
    root "BreakBinSub"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_break_bin_sub)
  end
end

CTBreakBinSub.register_class_with_id
