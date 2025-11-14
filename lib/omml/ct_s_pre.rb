# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_s_pre_pr"
require_relative "ct_o_math_arg"
class CTSPre < Lutaml::Model::Serializable
  attribute :s_pre_pr, :ct_s_pre_pr, collection: 0..1
  attribute :sub, :ct_o_math_arg
  attribute :sup, :ct_o_math_arg
  attribute :e, :ct_o_math_arg

  xml do
    root "SPre"

    sequence do
      map_element :sPrePr, to: :s_pre_pr
      map_element :sub, to: :sub
      map_element :sup, to: :sup
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_s_pre)
  end
end

CTSPre.register_class_with_id
