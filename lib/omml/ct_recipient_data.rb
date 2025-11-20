# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_on_off"
require_relative "ct_decimal_number"
require_relative "base64_binary"
class CTRecipientData < Lutaml::Model::Serializable
  attribute :active, :ct_on_off, collection: 0..1
  attribute :column, :ct_decimal_number, collection: 1..1
  attribute :unique_tag, :base64_binary, collection: 1..1

  xml do
    root "RecipientData", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :active, to: :active
      map_element :column, to: :column
      map_element :uniqueTag, to: :unique_tag
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_recipient_data)
  end
end

CTRecipientData.register_class_with_id
