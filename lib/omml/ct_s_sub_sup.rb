# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_s_sub_sup_pr"
require_relative "ct_o_math_arg"
class CTSSubSup < Lutaml::Model::Serializable
  attribute :s_sub_sup_pr, :ct_s_sub_sup_pr, collection: 0..1
  attribute :e, :ct_o_math_arg
  attribute :sub, :ct_o_math_arg
  attribute :sup, :ct_o_math_arg

  xml do
    root "SSubSup"

    sequence do
      map_element :sSubSupPr, to: :s_sub_sup_pr
      map_element :e, to: :e
      map_element :sub, to: :sub
      map_element :sup, to: :sup
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_s_sub_sup)
  end
end

CTSSubSup.register_class_with_id
