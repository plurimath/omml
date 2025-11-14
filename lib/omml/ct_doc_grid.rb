# frozen_string_literal: true

require "lutaml/model"
require_relative "st_doc_grid"
require_relative "st_decimal_number"
class CTDocGrid < Lutaml::Model::Serializable
  attribute :type, :st_doc_grid
  attribute :line_pitch, :st_decimal_number
  attribute :char_space, :st_decimal_number

  xml do
    root "DocGrid"

    map_attribute :type, to: :type
    map_attribute :linePitch, to: :line_pitch
    map_attribute :charSpace, to: :char_space
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_grid)
  end
end

CTDocGrid.register_class_with_id
