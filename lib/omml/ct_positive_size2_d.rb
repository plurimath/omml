# frozen_string_literal: true

require "lutaml/model"
require_relative "st_positive_coordinate"
class CTPositiveSize2D < Lutaml::Model::Serializable
  attribute :cx, :st_positive_coordinate
  attribute :cy, :st_positive_coordinate

  xml do
    root "PositiveSize2D", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :cx, to: :cx
    map_attribute :cy, to: :cy
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_positive_size2_d)
  end
end

CTPositiveSize2D.register_class_with_id
