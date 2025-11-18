# frozen_string_literal: true

require "lutaml/model"
require_relative "st_percentage"
class CTRelativeRect < Lutaml::Model::Serializable
  attribute :l, :st_percentage
  attribute :t, :st_percentage
  attribute :r, :st_percentage
  attribute :b, :st_percentage

  xml do
    root "RelativeRect"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :l, to: :l
    map_attribute :t, to: :t
    map_attribute :r, to: :r
    map_attribute :b, to: :b
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_relative_rect)
  end
end

CTRelativeRect.register_class_with_id
