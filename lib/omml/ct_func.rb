# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_func_pr"
require_relative "ct_o_math_arg"
class CTFunc < Lutaml::Model::Serializable
  attribute :func_pr, :ct_func_pr, collection: 0..1
  attribute :f_name, :ct_o_math_arg
  attribute :e, :ct_o_math_arg

  xml do
    root "Func", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :funcPr, to: :func_pr
      map_element :fName, to: :f_name
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_func)
  end
end

CTFunc.register_class_with_id
