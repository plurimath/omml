# frozen_string_literal: true

require "lutaml/model"
require_relative "st_guid"
class CTGuid < Lutaml::Model::Serializable
  attribute :val, :st_guid

  xml do
    root "Guid"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_guid)
  end
end

CTGuid.register_class_with_id
