# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_s_sup_pr"
require_relative "ct_o_math_arg"
class CTSSup < Lutaml::Model::Serializable
  attribute :s_sup_pr, :ct_s_sup_pr, collection: 0..1
  attribute :e, :ct_o_math_arg
  attribute :sup, :ct_o_math_arg

  xml do
    root "SSup"

    sequence do
      map_element :sSupPr, to: :s_sup_pr
      map_element :e, to: :e
      map_element :sup, to: :sup
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_s_sup)
  end
end

CTSSup.register_class_with_id
