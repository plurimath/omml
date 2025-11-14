# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_panose"
require_relative "ct_uchar_hex_number"
require_relative "ct_font_family"
require_relative "ct_on_off"
require_relative "ct_pitch"
require_relative "ct_font_sig"
require_relative "ct_font_rel"
require_relative "st_string"
class CTFont < Lutaml::Model::Serializable
  attribute :alt_name, :ct_string, collection: 0..1
  attribute :panose1, :ct_panose, collection: 0..1
  attribute :charset, :ct_uchar_hex_number, collection: 0..1
  attribute :family, :ct_font_family, collection: 0..1
  attribute :not_true_type, :ct_on_off, collection: 0..1
  attribute :pitch, :ct_pitch, collection: 0..1
  attribute :sig, :ct_font_sig, collection: 0..1
  attribute :embed_regular, :ct_font_rel, collection: 0..1
  attribute :embed_bold, :ct_font_rel, collection: 0..1
  attribute :embed_italic, :ct_font_rel, collection: 0..1
  attribute :embed_bold_italic, :ct_font_rel, collection: 0..1
  attribute :name, :st_string

  xml do
    root "Font"

    sequence do
      map_element :altName, to: :alt_name
      map_element :panose1, to: :panose1
      map_element :charset, to: :charset
      map_element :family, to: :family
      map_element :notTrueType, to: :not_true_type
      map_element :pitch, to: :pitch
      map_element :sig, to: :sig
      map_element :embedRegular, to: :embed_regular
      map_element :embedBold, to: :embed_bold
      map_element :embedItalic, to: :embed_italic
      map_element :embedBoldItalic, to: :embed_bold_italic
    end
    map_attribute :name, to: :name
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_font)
  end
end

CTFont.register_class_with_id
