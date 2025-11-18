# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_o_math_para_pr"
require_relative "ct_o_math"
class CTOMathPara < Lutaml::Model::Serializable
  attribute :o_math_para_pr, :ct_o_math_para_pr, collection: 0..1
  attribute :o_math, :ct_o_math, collection: 1..Float::INFINITY

  xml do
    root "oMathPara"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :oMathParaPr, to: :o_math_para_pr
      map_element :oMath, to: :o_math
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_o_math_para)
  end
end

CTOMathPara.register_class_with_id
