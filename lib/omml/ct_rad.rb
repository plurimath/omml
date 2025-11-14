# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_rad_pr"
require_relative "ct_o_math_arg"
class CTRad < Lutaml::Model::Serializable
  attribute :rad_pr, :ct_rad_pr, collection: 0..1
  attribute :deg, :ct_o_math_arg
  attribute :e, :ct_o_math_arg

  xml do
    root "Rad"

    sequence do
      map_element :radPr, to: :rad_pr
      map_element :deg, to: :deg
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_rad)
  end
end

CTRad.register_class_with_id
