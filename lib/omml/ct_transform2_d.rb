# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_point2_d"
require_relative "ct_positive_size2_d"
require_relative "st_angle"
class CTTransform2D < Lutaml::Model::Serializable
  attribute :off, :ct_point2_d, collection: 0..1
  attribute :ext, :ct_positive_size2_d, collection: 0..1
  attribute :rot, :st_angle
  attribute :flip_h, :boolean
  attribute :flip_v, :boolean

  xml do
    root "Transform2D"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :off, to: :off
      map_element :ext, to: :ext
    end
    map_attribute :rot, to: :rot
    map_attribute :flipH, to: :flip_h
    map_attribute :flipV, to: :flip_v
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_transform2_d)
  end
end

CTTransform2D.register_class_with_id
