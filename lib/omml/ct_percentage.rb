# frozen_string_literal: true

require "lutaml/model"
require_relative "st_percentage"
class CTPercentage < Lutaml::Model::Serializable
  attribute :val, :st_percentage

  xml do
    root "Percentage", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_percentage)
  end
end

CTPercentage.register_class_with_id
