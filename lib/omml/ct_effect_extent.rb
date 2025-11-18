# frozen_string_literal: true

require "lutaml/model"
require_relative "st_coordinate"
class CTEffectExtent < Lutaml::Model::Serializable
  attribute :l, :st_coordinate
  attribute :t, :st_coordinate
  attribute :r, :st_coordinate
  attribute :b, :st_coordinate

  xml do
    root "EffectExtent"
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
    register.register_model(self, id: :ct_effect_extent)
  end
end

CTEffectExtent.register_class_with_id
