# frozen_string_literal: true

require "lutaml/model"
require_relative "st_multi_level_type"
class CTMultiLevelType < Lutaml::Model::Serializable
  attribute :val, :st_multi_level_type

  xml do
    root "MultiLevelType"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_multi_level_type)
  end
end

CTMultiLevelType.register_class_with_id
