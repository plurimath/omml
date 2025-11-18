# frozen_string_literal: true

require "lutaml/model"
require_relative "st_shp"
class CTShp < Lutaml::Model::Serializable
  attribute :val, :st_shp

  xml do
    root "Shp"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_shp)
  end
end

CTShp.register_class_with_id
