# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_d_pr"
require_relative "ct_o_math_arg"
class CTD < Lutaml::Model::Serializable
  attribute :d_pr, :ct_d_pr, collection: 0..1
  attribute :e, :ct_o_math_arg, collection: 1..Float::INFINITY

  xml do
    root "D"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :dPr, to: :d_pr
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_d)
  end
end

CTD.register_class_with_id
