# frozen_string_literal: true

require "lutaml/model"
require_relative "st_view"
class CTView < Lutaml::Model::Serializable
  attribute :val, :st_view

  xml do
    root "View", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_view)
  end
end

CTView.register_class_with_id
