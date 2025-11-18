# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_o_math_arg"
class CTMR < Lutaml::Model::Serializable
  attribute :e, :ct_o_math_arg, collection: 1..Float::INFINITY

  xml do
    root "MR"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_mr)
  end
end

CTMR.register_class_with_id
