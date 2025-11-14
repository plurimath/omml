# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_border_box_pr"
require_relative "ct_o_math_arg"
class CTBorderBox < Lutaml::Model::Serializable
  attribute :border_box_pr, :ct_border_box_pr, collection: 0..1
  attribute :e, :ct_o_math_arg

  xml do
    root "BorderBox"

    sequence do
      map_element :borderBoxPr, to: :border_box_pr
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_border_box)
  end
end

CTBorderBox.register_class_with_id
