# frozen_string_literal: true

require "lutaml/model"
require_relative "st_positive_percentage"
class CTPositivePercentage < Lutaml::Model::Serializable
  attribute :val, :st_positive_percentage

  xml do
    root "PositivePercentage"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_positive_percentage)
  end
end

CTPositivePercentage.register_class_with_id
