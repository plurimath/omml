# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_ratio"
class CTScale2D < Lutaml::Model::Serializable
  attribute :sx, :ct_ratio, collection: 1..1
  attribute :sy, :ct_ratio, collection: 1..1

  xml do
    root "Scale2D"

    sequence do
      map_element :sx, to: :sx
      map_element :sy, to: :sy
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_scale2_d)
  end
end

CTScale2D.register_class_with_id
