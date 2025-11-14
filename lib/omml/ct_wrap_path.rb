# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_point2_d"
class CTWrapPath < Lutaml::Model::Serializable
  attribute :start, :ct_point2_d, collection: 1..1
  attribute :line_to, :ct_point2_d, collection: 2..Float::INFINITY
  attribute :edited, :boolean

  xml do
    root "WrapPath"

    sequence do
      map_element :start, to: :start
      map_element :lineTo, to: :line_to
    end
    map_attribute :edited, to: :edited
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_wrap_path)
  end
end

CTWrapPath.register_class_with_id
