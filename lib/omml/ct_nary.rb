# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_nary_pr"
require_relative "ct_o_math_arg"
class CTNary < Lutaml::Model::Serializable
  attribute :nary_pr, :ct_nary_pr, collection: 0..1
  attribute :sub, :ct_o_math_arg
  attribute :sup, :ct_o_math_arg
  attribute :e, :ct_o_math_arg

  xml do
    root "Nary"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :naryPr, to: :nary_pr
      map_element :sub, to: :sub
      map_element :sup, to: :sup
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_nary)
  end
end

CTNary.register_class_with_id
