# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_bar_pr"
require_relative "ct_o_math_arg"
class CTBar < Lutaml::Model::Serializable
  attribute :bar_pr, :ct_bar_pr, collection: 0..1
  attribute :e, :ct_o_math_arg

  xml do
    root "Bar"

    sequence do
      map_element :barPr, to: :bar_pr
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_bar)
  end
end

CTBar.register_class_with_id
