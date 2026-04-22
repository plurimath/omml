# frozen_string_literal: true

module Omml
  module Models
    class CTFFData < Lutaml::Model::Serializable
      choice(min: 1, max: Float::INFINITY) do
        attribute :name, :ct_ff_name
        attribute :enabled, :ct_on_off
        attribute :calc_on_exit, :ct_on_off
        attribute :entry_macro, :ct_macro_name, collection: 0..1
        attribute :exit_macro, :ct_macro_name, collection: 0..1
        attribute :help_text, :ct_ff_help_text, collection: 0..1
        attribute :status_text, :ct_ff_status_text, collection: 0..1
        choice(min: 1, max: 1) do
          attribute :check_box, :ct_ff_check_box
          attribute :dd_list, :ct_ffdd_list
          attribute :text_input, :ct_ff_text_input
        end
      end

      xml do
        element "CT_FFData"

        namespace Omml::Namespace

        map_element :name, to: :name, render_empty: true
        map_element :enabled, to: :enabled, render_empty: true
        map_element :calcOnExit, to: :calc_on_exit, render_empty: true
        map_element :entryMacro, to: :entry_macro
        map_element :exitMacro, to: :exit_macro
        map_element :helpText, to: :help_text
        map_element :statusText, to: :status_text
        map_element :checkBox, to: :check_box, render_empty: true
        map_element :ddList, to: :dd_list, render_empty: true
        map_element :textInput, to: :text_input, render_empty: true
      end
    end

    Omml::Configuration.register_model(CTFFData)
  end
end
