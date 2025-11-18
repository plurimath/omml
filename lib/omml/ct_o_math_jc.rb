# frozen_string_literal: true

require "lutaml/model"
require_relative "st_jc"
class CTOMathJc < Lutaml::Model::Serializable
  attribute :val, :st_jc

  xml do
    root "OMathJc"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_o_math_jc)
  end
end

CTOMathJc.register_class_with_id
