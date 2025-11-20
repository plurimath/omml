# frozen_string_literal: true

require "lutaml/model"
require_relative "st_twips_measure"
class CTColumn < Lutaml::Model::Serializable
  attribute :w, :st_twips_measure
  attribute :space, :st_twips_measure

  xml do
    root "Column", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :w, to: :w
    map_attribute :space, to: :space
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_column)
  end
end

CTColumn.register_class_with_id
