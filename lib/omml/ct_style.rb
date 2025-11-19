# frozen_string_literal: true

require "lutaml/model"
require_relative "st_style"
class CTStyle < Lutaml::Model::Serializable
  attribute :val, :st_style

  xml do
    root "Style"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val,
                        namespace: "http://schemas.openxmlformats.org/officeDocument/2006/math",
                        prefix: "m"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_style)
  end
end

CTStyle.register_class_with_id
