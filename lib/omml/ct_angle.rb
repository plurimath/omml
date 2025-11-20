# frozen_string_literal: true

require "lutaml/model"
require_relative "st_angle"
class CTAngle < Lutaml::Model::Serializable
  attribute :val, :st_angle

  xml do
    root "Angle", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_angle)
  end
end

CTAngle.register_class_with_id
