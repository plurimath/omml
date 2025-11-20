# frozen_string_literal: true

require "lutaml/model"
require_relative "st_positive_fixed_percentage"
class CTPositiveFixedPercentage < Lutaml::Model::Serializable
  attribute :val, :st_positive_fixed_percentage

  xml do
    root "PositiveFixedPercentage", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_positive_fixed_percentage)
  end
end

CTPositiveFixedPercentage.register_class_with_id
