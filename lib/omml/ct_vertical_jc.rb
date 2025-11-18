# frozen_string_literal: true

require "lutaml/model"
require_relative "st_vertical_jc"
class CTVerticalJc < Lutaml::Model::Serializable
  attribute :val, :st_vertical_jc

  xml do
    root "VerticalJc"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_vertical_jc)
  end
end

CTVerticalJc.register_class_with_id
