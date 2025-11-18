# frozen_string_literal: true

require "lutaml/model"
require_relative "st_zoom"
require_relative "st_decimal_number"
class CTZoom < Lutaml::Model::Serializable
  attribute :val, :st_zoom
  attribute :percent, :st_decimal_number

  xml do
    root "Zoom"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
    map_attribute :percent, to: :percent
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_zoom)
  end
end

CTZoom.register_class_with_id
