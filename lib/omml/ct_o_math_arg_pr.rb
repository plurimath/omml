# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_integer2"
class CTOMathArgPr < Lutaml::Model::Serializable
  attribute :arg_sz, :ct_integer2, collection: 0..1

  xml do
    root "OMathArgPr"

    sequence do
      map_element :argSz, to: :arg_sz
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_o_math_arg_pr)
  end
end

CTOMathArgPr.register_class_with_id
