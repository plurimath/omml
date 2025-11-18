# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_ruby_align"
require_relative "ct_hps_measure"
require_relative "ct_lang"
require_relative "ct_on_off"
class CTRubyPr < Lutaml::Model::Serializable
  attribute :ruby_align, :ct_ruby_align
  attribute :hps, :ct_hps_measure
  attribute :hps_raise, :ct_hps_measure
  attribute :hps_base_text, :ct_hps_measure
  attribute :lid, :ct_lang
  attribute :dirty, :ct_on_off, collection: 0..1

  xml do
    root "RubyPr"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :rubyAlign, to: :ruby_align
      map_element :hps, to: :hps
      map_element :hpsRaise, to: :hps_raise
      map_element :hpsBaseText, to: :hps_base_text
      map_element :lid, to: :lid
      map_element :dirty, to: :dirty
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ruby_pr)
  end
end

CTRubyPr.register_class_with_id
