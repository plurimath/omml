# frozen_string_literal: true

require "lutaml/model"
require_relative "st_char"
class CTChar < Lutaml::Model::Serializable
  attribute :val, :st_char

  xml do
    root "Char", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val,
                        value_map: { to: { empty: :empty } },
                        namespace: "http://schemas.openxmlformats.org/officeDocument/2006/math",
                        prefix: "m"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_char)
  end
end

CTChar.register_class_with_id
