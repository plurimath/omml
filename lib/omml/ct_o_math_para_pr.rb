# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_o_math_jc"
class CTOMathParaPr < Lutaml::Model::Serializable
  attribute :jc, :ct_o_math_jc, collection: 0..1

  xml do
    root "OMathParaPr"

    sequence do
      map_element :jc, to: :jc
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_o_math_para_pr)
  end
end

CTOMathParaPr.register_class_with_id
