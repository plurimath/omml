# frozen_string_literal: true

require "lutaml/model"
require_relative "st_string"
require_relative "st_caption_pos"
require_relative "st_on_off"
require_relative "st_decimal_number"
require_relative "st_number_format"
require_relative "st_chapter_sep"
class CTCaption < Lutaml::Model::Serializable
  attribute :name, :st_string
  attribute :pos, :st_caption_pos
  attribute :chap_num, :st_on_off
  attribute :heading, :st_decimal_number
  attribute :no_label, :st_on_off
  attribute :num_fmt, :st_number_format
  attribute :sep, :st_chapter_sep

  xml do
    root "Caption", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :name, to: :name
    map_attribute :pos, to: :pos
    map_attribute :chapNum, to: :chap_num
    map_attribute :heading, to: :heading
    map_attribute :noLabel, to: :no_label
    map_attribute :numFmt, to: :num_fmt
    map_attribute :sep, to: :sep
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_caption)
  end
end

CTCaption.register_class_with_id
