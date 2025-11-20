# frozen_string_literal: true

require "lutaml/model"
require_relative "st_on_off"
class CTSdtText < Lutaml::Model::Serializable
  attribute :multi_line, :st_on_off

  xml do
    root "SdtText", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :multiLine, to: :multi_line
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_text)
  end
end

CTSdtText.register_class_with_id
