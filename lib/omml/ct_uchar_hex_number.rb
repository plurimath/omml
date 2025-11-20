# frozen_string_literal: true

require "lutaml/model"
require_relative "st_uchar_hex_number"
class CTUcharHexNumber < Lutaml::Model::Serializable
  attribute :val, :st_uchar_hex_number

  xml do
    root "UcharHexNumber", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_uchar_hex_number)
  end
end

CTUcharHexNumber.register_class_with_id
