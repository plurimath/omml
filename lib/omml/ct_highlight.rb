# frozen_string_literal: true

require "lutaml/model"
require_relative "st_highlight_color"
class CTHighlight < Lutaml::Model::Serializable
  attribute :val, :st_highlight_color

  xml do
    root "Highlight", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_highlight)
  end
end

CTHighlight.register_class_with_id
