# frozen_string_literal: true

module Omml
  module Models
    class CTRubyPr < Lutaml::Model::Serializable
      attribute :ruby_align, :ct_ruby_align
      attribute :hps, :ct_hps_measure
      attribute :hps_raise, :ct_hps_measure
      attribute :hps_base_text, :ct_hps_measure
      attribute :lid, :ct_lang
      attribute :dirty, :ct_on_off, collection: 0..1

      xml do
        element "CT_RubyPr"

        namespace Omml::Namespace

        sequence do
          map_element :rubyAlign, to: :ruby_align, render_empty: true
          map_element :hps, to: :hps, render_empty: true
          map_element :hpsRaise, to: :hps_raise, render_empty: true
          map_element :hpsBaseText, to: :hps_base_text, render_empty: true
          map_element :lid, to: :lid, render_empty: true
          map_element :dirty, to: :dirty
        end
      end
    end

    Omml::Configuration.register_model(CTRubyPr)
  end
end
