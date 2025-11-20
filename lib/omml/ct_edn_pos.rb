# frozen_string_literal: true

require "lutaml/model"
require_relative "st_edn_pos"
class CTEdnPos < Lutaml::Model::Serializable
  attribute :val, :st_edn_pos

  xml do
    root "EdnPos", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_edn_pos)
  end
end

CTEdnPos.register_class_with_id
