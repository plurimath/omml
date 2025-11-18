# frozen_string_literal: true

require "lutaml/model"
require_relative "st_fixed_percentage"
class CTFixedPercentage < Lutaml::Model::Serializable
  attribute :val, :st_fixed_percentage

  xml do
    root "FixedPercentage"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_fixed_percentage)
  end
end

CTFixedPercentage.register_class_with_id
