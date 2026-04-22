# frozen_string_literal: true

module Omml
  module Models
    class CTFFCheckBox < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        attribute :size, :ct_hps_measure
        attribute :size_auto, :ct_on_off
      end
      attribute :default, :ct_on_off, collection: 0..1
      attribute :checked, :ct_on_off, collection: 0..1

      xml do
        element "CT_FFCheckBox"

        namespace Omml::Namespace

        sequence do
          map_element :size, to: :size, render_empty: true
          map_element :sizeAuto, to: :size_auto, render_empty: true
          map_element :default, to: :default
          map_element :checked, to: :checked
        end
      end
    end

    Omml::Configuration.register_model(CTFFCheckBox)
  end
end
