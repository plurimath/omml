# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_color_transform"
require_relative "st_system_color_val"
require_relative "st_hex_binary3"
class CTSystemColor < Lutaml::Model::Serializable
  import_model_attributes :eg_color_transform
  attribute :val, :st_system_color_val
  attribute :last_clr, :st_hex_binary3

  xml do
    root "SystemColor", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_color_transform
    end
    map_attribute :val, to: :val
    map_attribute :lastClr, to: :last_clr
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_system_color)
  end
end

CTSystemColor.register_class_with_id
