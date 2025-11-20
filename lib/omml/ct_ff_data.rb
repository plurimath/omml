# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_ff_name"
require_relative "ct_on_off"
require_relative "ct_macro_name"
require_relative "ct_ff_help_text"
require_relative "ct_ff_status_text"
require_relative "ct_ff_check_box"
require_relative "ct_ffdd_list"
require_relative "ct_ff_text_input"
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
    root "FFData", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_element :name, to: :name
    map_element :enabled, to: :enabled
    map_element :calcOnExit, to: :calc_on_exit
    map_element :entryMacro, to: :entry_macro
    map_element :exitMacro, to: :exit_macro
    map_element :helpText, to: :help_text
    map_element :statusText, to: :status_text
    map_element :checkBox, to: :check_box
    map_element :ddList, to: :dd_list
    map_element :textInput, to: :text_input
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ff_data)
  end
end

CTFFData.register_class_with_id
