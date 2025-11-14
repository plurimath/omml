# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_on_off"
require_relative "ct_signed_twips_measure"
require_relative "ct_div_bdr"
require_relative "ct_divs"
require_relative "st_decimal_number"
class CTDiv < Lutaml::Model::Serializable
  attribute :block_quote, :ct_on_off, collection: 0..1
  attribute :body_div, :ct_on_off, collection: 0..1
  attribute :mar_left, :ct_signed_twips_measure
  attribute :mar_right, :ct_signed_twips_measure
  attribute :mar_top, :ct_signed_twips_measure
  attribute :mar_bottom, :ct_signed_twips_measure
  attribute :div_bdr, :ct_div_bdr, collection: 0..1
  attribute :divs_child, :ct_divs, collection: 0..Float::INFINITY
  attribute :id, :st_decimal_number

  xml do
    root "Div"

    sequence do
      map_element :blockQuote, to: :block_quote
      map_element :bodyDiv, to: :body_div
      map_element :marLeft, to: :mar_left
      map_element :marRight, to: :mar_right
      map_element :marTop, to: :mar_top
      map_element :marBottom, to: :mar_bottom
      map_element :divBdr, to: :div_bdr
      map_element :divsChild, to: :divs_child
    end
    map_attribute :id, to: :id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_div)
  end
end

CTDiv.register_class_with_id
