# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_s_sub_pr"
require_relative "ct_o_math_arg"
class CTSSub < Lutaml::Model::Serializable
  attribute :s_sub_pr, :ct_s_sub_pr, collection: 0..1
  attribute :e, :ct_o_math_arg
  attribute :sub, :ct_o_math_arg

  xml do
    root "SSub", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :sSubPr, to: :s_sub_pr
      map_element :e, to: :e
      map_element :sub, to: :sub
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_s_sub)
  end
end

CTSSub.register_class_with_id
