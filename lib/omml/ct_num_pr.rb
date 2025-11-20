# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_decimal_number"
require_relative "ct_track_change_numbering"
require_relative "ct_track_change"
class CTNumPr < Lutaml::Model::Serializable
  attribute :ilvl, :ct_decimal_number, collection: 0..1
  attribute :num_id, :ct_decimal_number, collection: 0..1
  attribute :numbering_change, :ct_track_change_numbering, collection: 0..1
  attribute :ins, :ct_track_change, collection: 0..1

  xml do
    root "NumPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :ilvl, to: :ilvl
      map_element :numId, to: :num_id
      map_element :numberingChange, to: :numbering_change
      map_element :ins, to: :ins
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_num_pr)
  end
end

CTNumPr.register_class_with_id
