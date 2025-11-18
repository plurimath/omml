# frozen_string_literal: true

require "lutaml/model"
require_relative "st_em"
class CTEm < Lutaml::Model::Serializable
  attribute :val, :st_em

  xml do
    root "Em"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_em)
  end
end

CTEm.register_class_with_id
