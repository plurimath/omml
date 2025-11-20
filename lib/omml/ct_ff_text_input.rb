# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_ff_text_type"
require_relative "ct_string"
require_relative "ct_decimal_number"
class CTFFTextInput < Lutaml::Model::Serializable
  attribute :type, :ct_ff_text_type, collection: 0..1
  attribute :default, :ct_string, collection: 0..1
  attribute :max_length, :ct_decimal_number, collection: 0..1
  attribute :format, :ct_string, collection: 0..1

  xml do
    root "FFTextInput", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :type, to: :type
      map_element :default, to: :default
      map_element :maxLength, to: :max_length
      map_element :format, to: :format
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ff_text_input)
  end
end

CTFFTextInput.register_class_with_id
