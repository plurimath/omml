# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_eq_arr_pr"
require_relative "ct_o_math_arg"
class CTEqArr < Lutaml::Model::Serializable
  attribute :eq_arr_pr, :ct_eq_arr_pr, collection: 0..1
  attribute :e, :ct_o_math_arg, collection: 1..Float::INFINITY

  xml do
    root "EqArr"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :eqArrPr, to: :eq_arr_pr
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_eq_arr)
  end
end

CTEqArr.register_class_with_id
