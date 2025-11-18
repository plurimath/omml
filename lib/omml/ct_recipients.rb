# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_recipient_data"
class CTRecipients < Lutaml::Model::Serializable
  attribute :recipient_data, :ct_recipient_data, collection: 1..Float::INFINITY

  xml do
    root "Recipients"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :recipientData, to: :recipient_data
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_recipients)
  end
end

CTRecipients.register_class_with_id
