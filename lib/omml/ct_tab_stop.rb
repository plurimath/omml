# frozen_string_literal: true

require "lutaml/model"
require_relative "st_tab_jc"
require_relative "st_tab_tlc"
require_relative "st_signed_twips_measure"
class CTTabStop < Lutaml::Model::Serializable
  attribute :val, :st_tab_jc
  attribute :leader, :st_tab_tlc
  attribute :pos, :st_signed_twips_measure

  xml do
    root "TabStop"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
    map_attribute :leader, to: :leader
    map_attribute :pos, to: :pos
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tab_stop)
  end
end

CTTabStop.register_class_with_id
