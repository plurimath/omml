# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_acc_pr"
require_relative "ct_o_math_arg"
class CTAcc < Lutaml::Model::Serializable
  attribute :acc_pr, :ct_acc_pr, collection: 0..1
  attribute :e, :ct_o_math_arg

  xml do
    root "Acc"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :accPr, to: :acc_pr
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_acc)
  end
end

CTAcc.register_class_with_id
