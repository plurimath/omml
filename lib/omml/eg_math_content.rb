# frozen_string_literal: true

require_relative "ct_o_math_para"
require_relative "ct_o_math"
class EGMathContent < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :o_math_para, :ct_o_math_para
    attribute :o_math, :ct_o_math
  end

  xml do
    no_root
    map_element :oMathPara, to: :o_math_para
    map_element :oMath, to: :o_math
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_math_content)
  end
end

EGMathContent.register_class_with_id
