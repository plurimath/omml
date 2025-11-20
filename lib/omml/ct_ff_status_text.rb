# frozen_string_literal: true

require "lutaml/model"
require_relative "st_info_text_type"
require_relative "st_ff_status_text_val"
class CTFFStatusText < Lutaml::Model::Serializable
  attribute :type, :st_info_text_type
  attribute :val, :st_ff_status_text_val

  xml do
    root "FFStatusText", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :type, to: :type
    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ff_status_text)
  end
end

CTFFStatusText.register_class_with_id
