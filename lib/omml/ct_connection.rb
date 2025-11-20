# frozen_string_literal: true

require "lutaml/model"
require_relative "st_drawing_element_id"
require_relative "unsigned_int"
class CTConnection < Lutaml::Model::Serializable
  attribute :id, :st_drawing_element_id
  attribute :idx, :unsigned_int

  xml do
    root "Connection", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :id, to: :id
    map_attribute :idx, to: :idx
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_connection)
  end
end

CTConnection.register_class_with_id
