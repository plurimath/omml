# frozen_string_literal: true

require "lutaml/model"
require_relative "st_text_alignment"
class CTTextAlignment < Lutaml::Model::Serializable
  attribute :val, :st_text_alignment

  xml do
    root "TextAlignment", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_text_alignment)
  end
end

CTTextAlignment.register_class_with_id
